# Figure plan
<!-- SUMMARY: settled apparatus for Truth-Tracking Profiles: 2 tables, 1 inline schematic, 2 figures; schematic done, both figures pending a tikz decision · status: 2 figures to build · updated: 2026-08-10 -->

Settled after the external figures review of 2026-08-10, which revised my "two, maybe three"
down to a more disciplined shape. Target: `main.tex`, 31pp, Synthese.

## Final apparatus

| Slot | Item | State |
|---|---|---|
| Table 1 | Four positions in the answerability architecture | exists |
| §4 inline schematic | The coarse dependency relation over stability, directed dependence, maintenance, corrective control | **done 2026-08-10** |
| Figure 1 | Derivative versus live answerability | **to build** |
| Table 2 | Architecture-sensitive system predictions (was Table 3) | exists, renumbered automatically |
| Figure 2 | The temporal discrimination design in §7.7 | **to build** |

Each has a distinct job: the first table defines the architecture, the first figure shows the
central dissociation, the second table applies the architecture across arrangements, and the
second figure shows how the explanatory claim could be tested.

**The old crosswalk table is gone.** It was removed on 2026-08-10 in the main revision pass,
for the reason the figures review independently gives: it made *integration* chiefly bear on
whether the checker reproduces the production route's error, and independence depends on
provenance, information access, objectives, and conditional error structure rather than on
integration. Two reviewers reached that separately. The audience-proxy complaint that
prompted the crosswalk ("six enumerations, no crosswalk") is now answered by reducing the
enumerations instead: the five features are named rather than numbered, and independence is
stated as cross-cutting.

## Figure 1: derivative versus live answerability

Three routes, not two:

1. **Historical.** target → source practice → world-directed correction → documents →
   training history → current production.
2. **Missing live route.** fresh discrepancy → blocked before reaching current production.
3. **Added live route.** fresh discrepancy → retrieval, sensor, instrument, checker, or
   reviewer → detection and attribution → uptake or revision.

**Correction to my earlier spec.** I had the blocking boundary as the weights freezing. That's
wrong, and it contradicts work the paper has already done: the bearer is the task-indexed
arrangement, not the model. The boundary is *training history fixed and no live
target-sensitive route active in this arrangement*. A model with mutable weights can still
lack a route to the relevant discrepancy, and a model with fixed weights can gain live
answerability through retrieval, sensors, execution, or human review.

The propaganda condition belongs on the historical arrow, labelled so that the figure doesn't
imply any dense causal ancestry supplies derivative answerability. Something like
*target-sensitive correction preserved in the training distribution*.

Placement: immediately after the paragraph beginning "Three things come apart here", where it
should replace some of the surrounding prose rather than lengthen §7.1.

## Figure 2: the temporal discrimination design

Only warranted because the design was repaired on 2026-08-10; the previous route-versus-string
version didn't isolate a live route, since a coverage account can define coverage over
information available to the arrangement rather than tokens already in the prompt.

```
Time 0    same record available to both arrangements
                          |
                 source record corrected        (plus a no-update control arm)
                          |
Time 1    static copied record  ──→  remains stale
          live lookup route     ──→  reaches the corrected record
```

**No outcome curves, estimated means, intervals, or mock error bars.** A condition diagram
with qualitative predictions only. A standalone interaction plot, even labelled schematic,
would read as imaginary data. The intervention-by-task prediction folds in here as a
qualitative annotation rather than becoming its own figure.

## Rejected, with reasons

- **Architecture as a cycle.** A cycle implies a fixed serial progression when the architecture
  is many-to-many and recurrent, and the paper says explicitly that one route can occupy
  several positions. Table 1 already carries this.
- **Standalone interaction plot.** A generic crossed-lines graph conveys little beyond "there
  is an interaction".
- **Izzy's profile.** The thought experiment works because it needs no apparatus.
- **System profiles × stabilizers.** Table 2 does it.
- **Four counterfactual features plus one rated.** Superseded: the fifth is no longer a rate,
  it's a conditional capacity, with realized effectiveness kept separate.
- **Decorative as a limit.** The prose formulation is enough.

## Blocking question before building

Neither figure can be built without `\usepackage{tikz}`, which the preamble snapshot lacks.
That interacts with the arXiv/Springer two-bundle problem already on file, so it wants
settling before the figures exist rather than after.
