# Reader-clarity review triage

The reviews identify real local friction, but several recommendations quote material whose structure has already improved. I recommend a bounded edit, not another manuscript-wide clarity pass.

## Adopt

### 1. Lighten the abstract's definition cluster

The first paragraph currently defines *answerability*, *arrangement*, *corrective control*, *truth-tracking*, and *profile* in six lines. The concepts belong there, but the parenthetical definitions make the syntax work too hard.

Suggested replacement:

> Recent work suggests that some large language model representations have content or reference. Grounding can secure either without supplying live routes for correction. This paper asks what follows from that gap. An output is *answerable* when discrepancies can affect what a target- and task-specific *arrangement* produces, accepts, or withdraws. The arrangement has *corrective control* only when live, sufficiently independent routes can detect and repair fresh discrepancies. Its route *profile* records those routes and their relations, supplying a basis for analysing patterned representational success.

This keeps the whole map but turns the last two parenthetical definitions into ordinary prose.

### 2. Split the introductory vocabulary paragraph once

The paragraph is not unintelligible, but it asks one paragraph to define both the world-side unit and two grades of target relation. Split after *profile*:

> An *arrangement* is a language model together with whatever prompts, records, tools, sensors, checkers, or reviewers are live for a particular target and task. Its *profile* records which routes constrain it and how they are coupled: which can check, calibrate, or correct which others.
>
> An output is *answerable* to a target to the extent that discrepancies can affect what the arrangement produces or accepts, including through later correction or withdrawal. That influence may be inherited, delayed, or supplied by external audit. The arrangement has *corrective control* only when live routes let it detect and repair a fresh discrepancy.

No new prose is needed.

### 3. Reorder the capacity/performance distinction

The existing block is accurate, but it defines all three quantities, negates one equivalence, gives a reductio, and then restates the positive definition. A clearer sequence is:

> These five features characterize corrective capacity, not observed performance. Capacity concerns what the architecture can do. Exercise frequency records how often a route actually alters production. Conditional repair performance records how well the whole arrangement responds when a relevant discrepancy is present, together with its rate of unnecessary or harmful intervention.
>
> Effective uptake is a capacity, not an exercise rate. A near-flawless arrangement in a benign environment may rarely need to exercise it; a poor generator may trigger a mediocre checker often. Nor does every alteration count as repair, since a change can move the output further from the target. Effective uptake therefore asks whether a detected, attributable discrepancy can produce a timely, target-improving change.

The following sentences about component rates and audited evidence can remain, with the now-duplicated definition of conditional repair performance removed.

### 4. Give the three-way answerability distinction three sentences

Suggested replacement:

> Three things come apart here. *Causal ancestry* requires only that material included in training shaped present production. *Derivative answerability* requires the inherited effects of target-sensitive correction. *Live answerability* requires a current route from a fresh discrepancy to production (Figure 1).

This is easier to scan and makes the differences, not the repeated relative clauses, carry the parallelism.

### 5. Repair two section hand-offs

At §4 → §5, replace the generic opening with:

> These features now provide a way to analyse the LLM pressure case. Begin by fixing the output-producing arrangement for the target and task.

At §5.6 → §5.7, add the retrospective link:

> The deployment case isolates two features: detectability and effective uptake. The broader empirical question is whether route-specific interventions transfer as the decomposition predicts.

Then cut the present opening sentence *Route-specific transfer provides a component test.* The new bridge does its work more concretely.

## Already adequate or stale

### Explicit *has changed* in the lead example

The suggested expansion is grammatically harmless but rhetorically worse. In “The truth conditions haven't changed; the route by which the claim became available has,” ellipsis makes the contrast compact and unambiguous. Keep it.

### §5.2 → §5.3 transition

The table immediately precedes the heading *Inherited structure and missing anchors*, whose opening sentence says that textual inheritance explains both competence and fragility. An extra backward-looking sentence would repeat the heading and topic sentence. Keep the current transition.

### Othello pacing

The manuscript already gives the limitation its own paragraph, beginning “Othello provides only a limited basis for a broader claim.” That is exactly the structural repair the review proposes. No change.

### Boyd's *fever* paragraph

The example already occupies a separate paragraph, followed by a paragraph beginning “Applied to text-trained arrangements…”. No further split is available or needed.

### §5.1 → §5.2 bridge

This is borderline. The §5.1 close states the boundary of live routes; the next heading names *Route-specific interventions* and the first paragraph supplies retrieval. A generic “Consider first…” transition would add little. I would leave it unless the PDF makes the heading visually easy to miss.

## General warning accepted only locally

Heavy compounds such as *target- and task-specific arrangement* and *held-out route–task combinations* are load-bearing later. The real problem is their concentration in the abstract. Lightening that paragraph is preferable to varying technical vocabulary across the paper.

## Scope

These edits preserve every claim, citation, example, prediction, and failure condition. They do not justify another structural pass or new explanatory material.

## Resolution

Implemented the abstract rewrite, the introductory paragraph split, the capacity/performance rewrite, the three-sentence ancestry distinction, and the §4→§5 transition. The §5.6→§5.7 bridge was refined to say that the deployment case illustrates detectability and effective uptake while leaving checking-route independence unresolved. The proposed lead-example expansion, extra §5.2→§5.3 bridge, Othello repacing, Boyd paragraph split, and generic §5.1→§5.2 bridge were declined for the reasons above.
