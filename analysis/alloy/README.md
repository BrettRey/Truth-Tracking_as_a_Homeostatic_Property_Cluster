# Alloy audit of corrective control

This bounded model audits the article's qualitative entailments. It distinguishes historical and live routes, represents the correction path in Figure 1, and derives the five features from route structure rather than treating them as free labels.

Run from the project root:

```sh
analysis/alloy/run_checks.sh
```

The script downloads the pinned Alloy 6.2.0 jar into `tmp/alloy/` when needed, verifies its checksum, executes every command, and prints a compact result summary. Set `ALLOY_JAR` to use an existing verified jar.

The expected results are:

- an arrangement with corrective control is satisfiable;
- corrective control requires live answerability and all five features within the checked scope;
- Alloy finds counterexamples to grounding entailing corrective control;
- it finds causal ancestry without derivative answerability;
- it finds derivative answerability without live answerability;
- it finds live answerability without corrective control;
- it finds all five features instantiated on disconnected routes without a connected correction path;
- it finds corrective capacity alongside a currently incorrect output.

The last two results protect distinctions made in the article: capacities must connect along one operative correction path, and possessing corrective control does not entail current correctness or a high exercise rate.

Alloy's positive results are complete only up to the declared finite scope. The model does not represent graded strength, statistical error dependence, epistemic warrant, or projectibility. Those are tested separately in `analysis/gelman_fake_data_workflow.R`.
