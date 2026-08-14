#!/usr/bin/env Rscript

# Fake-data checks for the profile decomposition.
#
# The script compares three fixed predictive models:
#   input coverage:       target access alone;
#   conditional coverage: target access, detectability, and checker independence;
#   decomposition:        conditional coverage plus attribution and uptake.
#
# It deliberately generates four worlds. In A uptake is a genuine bottleneck;
# in B conditional coverage is sufficient and the extra feature scores are
# non-causal; in C the decomposition is true but its distinctive features are
# measured too noisily to guide prediction reliably; and in D the decomposition
# improves prediction without improving intervention choice.

inv_logit <- function(x) 1 / (1 + exp(-x))
clip <- function(x, lo = 0.01, hi = 0.99) pmin(hi, pmax(lo, x))

parse_reps <- function(args, default = 200L) {
  hit <- grep("^--replications=", args, value = TRUE)
  if (!length(hit)) return(default)
  as.integer(sub("^--replications=", "", hit[[1]]))
}

fit_multiplier <- function(success, total, exposure) {
  keep <- total > 0
  success <- success[keep]
  total <- total[keep]
  exposure <- exposure[keep]
  objective <- function(theta) {
    p <- clip(theta * exposure, 1e-8, 1 - 1e-8)
    -sum(dbinom(success, total, p, log = TRUE))
  }
  optimize(objective, interval = c(1e-5, 0.99999))$minimum
}

binary_scores <- function(success, total, probability) {
  p <- clip(probability, 1e-8, 1 - 1e-8)
  observed <- success / total
  log_loss <- -sum(success * log(p) + (total - success) * log(1 - p)) / sum(total)
  brier <- sum(total * (observed * (1 - p)^2 + (1 - observed) * p^2)) / sum(total)
  c(log_loss = log_loss, brier = brier)
}

make_cells <- function(seed, scenario, n_arrangements = 30L, trials = 120L) {
  set.seed(seed)
  arrangements <- seq_len(n_arrangements)
  tasks <- c("record", "measurement")
  interventions <- c("none", "retrieval", "measurement", "checker", "gate")
  d <- expand.grid(
    arrangement = arrangements,
    task = tasks,
    intervention = interventions,
    KEEP.OUT.ATTRS = FALSE,
    stringsAsFactors = FALSE
  )

  arrangement_effect <- rnorm(n_arrangements, 0, 0.35)
  access_effect <- rnorm(n_arrangements, 0, 0.10)
  detectability <- clip(inv_logit(rnorm(n_arrangements, 0.45, 0.45)), 0.18, 0.94)
  independence <- clip(inv_logit(rnorm(n_arrangements, 0.15, 0.55)), 0.12, 0.94)
  attribution <- clip(inv_logit(rnorm(n_arrangements, 0.25, 0.65)), 0.10, 0.96)
  uptake_location <- if (scenario == "A") -1.15 else -0.05
  uptake <- clip(inv_logit(rnorm(n_arrangements, uptake_location, 0.75)), 0.05, 0.96)
  false_signal <- clip(inv_logit(rnorm(n_arrangements, -2.65, 0.35)), 0.015, 0.20)

  idx <- d$arrangement
  task_shift <- ifelse(d$task == "record", 0.15, -0.12)
  d$p_initial <- clip(inv_logit(-0.15 + arrangement_effect[idx] + task_shift), 0.18, 0.88)
  d$target_access <- clip(
    ifelse(d$task == "record", 0.35, 0.27) + access_effect[idx], 0.08, 0.82
  )
  d$detectability <- detectability[idx]
  d$independence <- independence[idx]
  d$attribution_latent <- attribution[idx]
  d$uptake_latent <- uptake[idx]
  d$false_signal <- false_signal[idx]

  access_gain <- if (scenario == "A") 0.28 else 0.43
  checker_detect_gain <- if (scenario == "A") 0.14 else 0.22
  checker_independence_gain <- if (scenario == "A") 0.18 else 0.27
  gate_gain <- if (scenario == "A") 0.64 else 0.42

  d$target_access <- d$target_access + ifelse(
    d$intervention == "retrieval",
    ifelse(d$task == "record", access_gain, 0.04), 0
  )
  d$target_access <- d$target_access + ifelse(
    d$intervention == "measurement",
    ifelse(d$task == "measurement", access_gain, 0.04), 0
  )
  d$detectability <- d$detectability + ifelse(
    d$intervention == "checker", checker_detect_gain, 0
  )
  d$independence <- d$independence + ifelse(
    d$intervention == "checker", checker_independence_gain, 0
  )
  d$false_signal <- d$false_signal - ifelse(d$intervention == "checker", 0.015, 0)
  d$uptake_latent <- d$uptake_latent + ifelse(d$intervention == "gate", gate_gain, 0)

  d$target_access <- clip(d$target_access)
  d$detectability <- clip(d$detectability)
  d$independence <- clip(d$independence)
  d$false_signal <- clip(d$false_signal, 0.005, 0.30)
  d$uptake_latent <- clip(d$uptake_latent)
  d$conditional_signal <- d$target_access * d$detectability * d$independence

  measurement_sd <- switch(scenario, A = 0.03, B = 0.03, C = 0.32, D = 0.03)
  d$attribution_observed <- clip(
    d$attribution_latent + rnorm(nrow(d), 0, measurement_sd)
  )
  d$uptake_observed <- clip(
    d$uptake_latent + rnorm(nrow(d), 0, measurement_sd)
  )

  repair_quality <- 0.84
  harm_quality <- 0.28
  if (scenario == "B") {
    d$p_repair_true <- d$conditional_signal * repair_quality
    d$p_harm_true <- d$false_signal * harm_quality
  } else {
    d$p_repair_true <- d$conditional_signal * d$attribution_latent *
      d$uptake_latent * repair_quality
    d$p_harm_true <- d$false_signal * d$attribution_latent *
      d$uptake_latent * harm_quality
  }
  d$p_final_true <- d$p_initial * (1 - d$p_harm_true) +
    (1 - d$p_initial) * d$p_repair_true

  d$n <- trials
  d$n_initial_correct <- rbinom(nrow(d), trials, d$p_initial)
  d$n_initial_wrong <- trials - d$n_initial_correct
  d$n_repaired <- rbinom(nrow(d), d$n_initial_wrong, d$p_repair_true)
  d$n_harmed <- rbinom(nrow(d), d$n_initial_correct, d$p_harm_true)
  d$n_final_correct <- d$n_initial_correct - d$n_harmed + d$n_repaired

  # Each task and intervention occurs in training, but four combinations do not.
  held_out_pair <-
    (d$task == "record" & d$intervention %in% c("measurement", "gate")) |
    (d$task == "measurement" & d$intervention %in% c("retrieval", "checker"))
  d$split <- ifelse(held_out_pair, "test", "train")
  d$scenario <- scenario
  d
}

exposure_for <- function(d, model) {
  if (model == "input") {
    repair <- d$target_access
    harm <- rep(1, nrow(d))
  } else if (model == "conditional") {
    repair <- d$conditional_signal
    harm <- d$false_signal
  } else if (model == "decomposition") {
    repair <- d$conditional_signal * d$attribution_observed * d$uptake_observed
    harm <- d$false_signal * d$attribution_observed * d$uptake_observed
  } else stop("Unknown model: ", model)
  list(repair = clip(repair, 1e-6, 1), harm = clip(harm, 1e-6, 1))
}

fit_candidate <- function(train, model) {
  exposure <- exposure_for(train, model)
  list(
    repair = fit_multiplier(train$n_repaired, train$n_initial_wrong, exposure$repair),
    harm = fit_multiplier(train$n_harmed, train$n_initial_correct, exposure$harm)
  )
}

predict_candidate <- function(d, model, fit) {
  exposure <- exposure_for(d, model)
  p_repair <- clip(fit$repair * exposure$repair, 1e-8, 1 - 1e-8)
  p_harm <- clip(fit$harm * exposure$harm, 1e-8, 1 - 1e-8)
  p_final <- d$p_initial * (1 - p_harm) + (1 - d$p_initial) * p_repair
  list(repair = p_repair, harm = p_harm, final = clip(p_final))
}

decision_scores <- function(d, predicted_final) {
  keys <- interaction(d$arrangement, d$task, drop = TRUE)
  groups <- split(seq_len(nrow(d)), keys)
  regret <- numeric(length(groups))
  correct <- logical(length(groups))
  i <- 1L
  for (rows in groups) {
    chosen <- rows[which.max(predicted_final[rows])]
    true_best <- max(d$p_final_true[rows])
    regret[[i]] <- true_best - d$p_final_true[chosen]
    correct[[i]] <- d$p_final_true[chosen] >= true_best - 1e-12
    i <- i + 1L
  }
  c(mean_regret = mean(regret), optimal_choice_rate = mean(correct))
}

run_replication <- function(replication, scenario, master_seed = 481516L) {
  scenario_offset <- match(scenario, c("A", "B", "C", "D")) * 100000L
  d <- make_cells(master_seed + scenario_offset + replication, scenario)
  train <- d[d$split == "train", ]
  test <- d[d$split == "test", ]
  models <- c("input", "conditional", "decomposition")
  results <- vector("list", length(models))

  for (j in seq_along(models)) {
    model <- models[[j]]
    fit <- fit_candidate(train, model)
    prediction <- predict_candidate(test, model, fit)
    repair_score <- binary_scores(test$n_repaired, test$n_initial_wrong, prediction$repair)
    harm_score <- binary_scores(test$n_harmed, test$n_initial_correct, prediction$harm)
    final_score <- binary_scores(test$n_final_correct, test$n, prediction$final)

    # Intervention choice is assessed on every potential intervention for each
    # arrangement-task context, including combinations withheld from fitting.
    all_prediction <- predict_candidate(d, model, fit)
    decisions <- decision_scores(d, all_prediction$final)

    results[[j]] <- data.frame(
      replication = replication,
      scenario = scenario,
      model = model,
      repair_multiplier = fit$repair,
      harm_multiplier = fit$harm,
      repair_log_loss = repair_score[["log_loss"]],
      harm_log_loss = harm_score[["log_loss"]],
      final_log_loss = final_score[["log_loss"]],
      final_brier = final_score[["brier"]],
      decision_regret = decisions[["mean_regret"]],
      optimal_choice_rate = decisions[["optimal_choice_rate"]]
    )
  }
  do.call(rbind, results)
}

summarize_results <- function(raw) {
  metrics <- c(
    "repair_multiplier", "harm_multiplier", "repair_log_loss", "harm_log_loss",
    "final_log_loss", "final_brier", "decision_regret", "optimal_choice_rate"
  )
  groups <- split(raw, interaction(raw$scenario, raw$model, drop = TRUE))
  out <- lapply(groups, function(g) {
    row <- data.frame(scenario = g$scenario[[1]], model = g$model[[1]])
    for (metric in metrics) {
      row[[paste0(metric, "_mean")]] <- mean(g[[metric]])
      row[[paste0(metric, "_sd")]] <- sd(g[[metric]])
    }
    row
  })
  result <- do.call(rbind, out)
  result[order(result$scenario, match(result$model,
    c("input", "conditional", "decomposition"))), ]
}

summarize_paired_comparisons <- function(raw) {
  conditional <- raw[raw$model == "conditional", ]
  decomposition <- raw[raw$model == "decomposition", ]
  joined <- merge(
    conditional, decomposition,
    by = c("replication", "scenario"),
    suffixes = c("_conditional", "_decomposition")
  )
  metrics <- c(
    "repair_log_loss", "harm_log_loss", "final_log_loss", "final_brier",
    "decision_regret", "optimal_choice_rate"
  )
  groups <- split(joined, joined$scenario)
  rows <- list()
  k <- 1L
  for (scenario in names(groups)) {
    g <- groups[[scenario]]
    for (metric in metrics) {
      delta <- g[[paste0(metric, "_decomposition")]] -
        g[[paste0(metric, "_conditional")]]
      lower_is_better <- metric != "optimal_choice_rate"
      rows[[k]] <- data.frame(
        scenario = scenario,
        metric = metric,
        delta_decomposition_minus_conditional_mean = mean(delta),
        delta_sd = sd(delta),
        delta_q05 = unname(quantile(delta, 0.05)),
        delta_q95 = unname(quantile(delta, 0.95)),
        proportion_decomposition_better = if (lower_is_better) {
          mean(delta < 0)
        } else {
          mean(delta > 0)
        }
      )
      k <- k + 1L
    }
  }
  do.call(rbind, rows)
}

paired_differences <- function(raw) {
  conditional <- raw[raw$model == "conditional", ]
  decomposition <- raw[raw$model == "decomposition", ]
  joined <- merge(
    conditional, decomposition,
    by = c("replication", "scenario"),
    suffixes = c("_conditional", "_decomposition")
  )
  joined$repair_loss_delta <- joined$repair_log_loss_decomposition -
    joined$repair_log_loss_conditional
  joined$optimal_choice_delta_pp <- 100 * (
    joined$optimal_choice_rate_decomposition -
      joined$optimal_choice_rate_conditional
  )
  joined
}

plot_paired_differences <- function(raw, path) {
  paired <- paired_differences(raw)
  scenarios <- c("A", "B", "C", "D")
  labels <- c(
    "A  Recovery check",
    "B  Signal sufficient",
    "C  Noisy features",
    "D  No decision surplus"
  )
  y <- rev(seq_along(scenarios))
  point_colour <- grDevices::adjustcolor("black", alpha.f = 0.14)

  grDevices::pdf(path, width = 7.25, height = 4.65, useDingbats = FALSE)
  old_par <- graphics::par(
    mfrow = c(1, 2),
    mar = c(3.5, 1.2, 2.5, 0.8),
    oma = c(0.2, 0.2, 1.5, 0.2),
    mgp = c(2.0, 0.55, 0),
    tcl = -0.25,
    las = 1,
    family = "serif"
  )
  on.exit({
    graphics::par(old_par)
    grDevices::dev.off()
  }, add = TRUE)

  panels <- list(
    list(
      variable = "repair_loss_delta",
      xlim = c(-0.014, 0.073),
      xlab = expression(Delta~"repair log loss"),
      title = "Repair prediction",
      better_left = "decomposition better",
      better_right = "conditional coverage better"
    ),
    list(
      variable = "optimal_choice_delta_pp",
      xlim = c(-65, 90),
      xlab = expression(Delta~"optimal choice (percentage points)"),
      title = "Intervention choice",
      better_left = "conditional coverage better",
      better_right = "decomposition better"
    )
  )

  for (panel_index in seq_along(panels)) {
    panel <- panels[[panel_index]]
    graphics::par(mar = if (panel_index == 1L) {
      c(3.5, 6.0, 2.5, 0.8)
    } else {
      c(3.5, 1.2, 2.5, 0.8)
    })
    graphics::plot(
      NA,
      xlim = panel$xlim,
      ylim = c(0.45, 4.55),
      xlab = panel$xlab,
      ylab = "",
      yaxt = "n",
      bty = "n",
      main = panel$title,
      cex.main = 1.0,
      cex.lab = 0.88,
      cex.axis = 0.78
    )
    graphics::abline(v = 0, lty = 3, col = "grey45")
    graphics::mtext(panel$better_left, side = 3, adj = 0, line = 0.25,
                    cex = 0.66, col = "grey25")
    graphics::mtext(panel$better_right, side = 3, adj = 1, line = 0.25,
                    cex = 0.66, col = "grey25")

    for (i in seq_along(scenarios)) {
      values <- paired[paired$scenario == scenarios[[i]], panel$variable]
      set.seed(8100L + 100L * panel_index + i)
      jittered_y <- y[[i]] + stats::runif(length(values), -0.16, 0.16)
      graphics::points(values, jittered_y, pch = 16, cex = 0.38,
                       col = point_colour)
      intervals <- stats::quantile(values, c(0.05, 0.25, 0.5, 0.75, 0.95))
      graphics::segments(intervals[[1]], y[[i]], intervals[[5]], y[[i]],
                         lwd = 1.1, col = "grey35")
      graphics::segments(intervals[[2]], y[[i]], intervals[[4]], y[[i]],
                         lwd = 4.0, col = "grey20")
      graphics::points(intervals[[3]], y[[i]], pch = 21, cex = 0.72,
                       bg = "white", col = "black", lwd = 1.0)
    }

    if (panel_index == 1L) {
      graphics::axis(2, at = y, labels = labels, tick = FALSE,
                     cex.axis = 0.72, las = 1)
    }
  }

  graphics::mtext(
    paste0("Paired differences across ",
           length(unique(paired$replication)), " constructed replications"),
    side = 3, outer = TRUE, line = 0.2, cex = 0.9
  )
}

calibration_table <- function(d, probability, bins = 10L) {
  breaks <- quantile(probability, probs = seq(0, 1, length.out = bins + 1),
                     na.rm = TRUE, type = 8)
  breaks <- unique(breaks)
  bin <- cut(probability, breaks = breaks, include.lowest = TRUE, labels = FALSE)
  groups <- split(seq_len(nrow(d)), bin)
  do.call(rbind, lapply(seq_along(groups), function(i) {
    rows <- groups[[i]]
    data.frame(
      bin = i,
      mean_prediction = weighted.mean(probability[rows], d$n[rows]),
      observed_rate = sum(d$n_final_correct[rows]) / sum(d$n[rows]),
      trials = sum(d$n[rows])
    )
  }))
}

args <- commandArgs(trailingOnly = TRUE)
replications <- parse_reps(args)
master_seed <- 481516L
raw <- do.call(rbind, lapply(c("A", "B", "C", "D"), function(scenario) {
  do.call(rbind, lapply(seq_len(replications), run_replication,
                       scenario = scenario, master_seed = master_seed))
}))
summary <- summarize_results(raw)
comparisons <- summarize_paired_comparisons(raw)

# One fixed replication supplies calibration data for inspection; the reported
# comparative results aggregate all replications above.
calibration_rows <- list()
counter <- 1L
for (scenario in c("A", "B", "C", "D")) {
  d <- make_cells(master_seed + match(scenario, c("A", "B", "C", "D")) * 100000L + 1L,
                  scenario)
  train <- d[d$split == "train", ]
  test <- d[d$split == "test", ]
  for (model in c("input", "conditional", "decomposition")) {
    fit <- fit_candidate(train, model)
    prediction <- predict_candidate(test, model, fit)
    tab <- calibration_table(test, prediction$final)
    tab$scenario <- scenario
    tab$model <- model
    calibration_rows[[counter]] <- tab
    counter <- counter + 1L
  }
}
calibration <- do.call(rbind, calibration_rows)

output_dir <- file.path("analysis", "results")
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
write.csv(raw, file.path(output_dir, "gelman_fake_data_replications.csv"), row.names = FALSE)
write.csv(summary, file.path(output_dir, "gelman_fake_data_summary.csv"), row.names = FALSE)
write.csv(
  comparisons,
  file.path(output_dir, "gelman_fake_data_paired_comparisons.csv"),
  row.names = FALSE
)
write.csv(calibration, file.path(output_dir, "gelman_fake_data_calibration.csv"), row.names = FALSE)
plot_paired_differences(
  raw,
  file.path(output_dir, "gelman_fake_data_paired_differences.pdf")
)

metadata <- c(
  paste0("master_seed=", master_seed),
  paste0("replications=", replications),
  "arrangements_per_replication=30",
  "task_families=record,measurement",
  "interventions=none,retrieval,measurement,checker,gate",
  "trials_per_cell=120",
  "scenario_A=structural uptake bottleneck, accurately measured",
  "scenario_B=conditional signal sufficient; attribution and uptake scores non-causal",
  "scenario_C=latent structural process with noisy attribution and uptake measures",
  "scenario_D=latent structural process without intervention-choice surplus",
  "training_pairs=record:{none,retrieval,checker};measurement:{none,measurement,gate}",
  "held_out_pairs=record:{measurement,gate};measurement:{retrieval,checker}"
)
writeLines(metadata, file.path(output_dir, "gelman_fake_data_metadata.txt"))

print(summary[, c(
  "scenario", "model", "final_log_loss_mean", "final_brier_mean",
  "decision_regret_mean", "optimal_choice_rate_mean"
)], row.names = FALSE, digits = 5)
