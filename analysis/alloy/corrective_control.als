module corrective_control

// A bounded relational audit of the manuscript's qualitative architecture.
// The model checks entailments and non-entailments; it does not represent
// graded strength, statistical performance, warrant, or projectibility.

abstract sig Node {}
sig Target, SourcePractice, TrainingText, ModelState, Evidence,
    Candidate, Check, Uptake, Output extends Node {}

abstract sig RouteKind {}
one sig Historical, Live extends RouteKind {}

sig Route {
  source: one Node,
  sink: one Node,
  kind: one RouteKind
}

sig Arrangement {
  target: one Target,
  candidate: one Candidate,
  output: one Output,
  routes: set Route,
  independentChecks: set Check,
  attributableChecks: set Check,
  groundedOutputs: set Output,
  correctionSurvivesTraining: set Output,
  currentlyIncorrect: set Output
}

fact ScopedOutputs {
  all a: Arrangement |
    a.groundedOutputs + a.correctionSurvivesTraining + a.currentlyIncorrect in a.output
}

fact NoSelfLoops {
  all r: Route | r.source != r.sink
}

fact EveryRouteBelongsToAnArrangement {
  Route = Arrangement.routes
}

// Keep generated counterexamples legible by restricting edges to the two
// architectures represented in Figure 1. A direct live target-output edge is
// admitted so that live answerability can be tested without corrective control.
fact RouteTyping {
  all r: Route |
    (r.kind = Historical implies
      r.source -> r.sink in
        Target -> SourcePractice +
        SourcePractice -> TrainingText +
        TrainingText -> ModelState +
        ModelState -> Output) and
    (r.kind = Live implies
      r.source -> r.sink in
        Target -> Evidence +
        Evidence -> Candidate +
        Evidence -> Check +
        Candidate -> Check +
        Check -> Uptake +
        Uptake -> Output +
        Target -> Output)
}

fun historicalEdges[a: Arrangement]: Node -> Node {
  {x, y: Node |
    some r: a.routes | r.kind = Historical and r.source = x and r.sink = y}
}

fun liveEdges[a: Arrangement]: Node -> Node {
  {x, y: Node |
    some r: a.routes | r.kind = Live and r.source = x and r.sink = y}
}

pred grounded[a: Arrangement] {
  a.output in a.groundedOutputs
}

// Historical inheritance follows the upper path in Figure 1.
pred causalAncestry[a: Arrangement] {
  some s: SourcePractice, t: TrainingText, m: ModelState |
    a.target -> s in historicalEdges[a] and
    s -> t in historicalEdges[a] and
    t -> m in historicalEdges[a] and
    m -> a.output in historicalEdges[a]
}

pred derivativeAnswerability[a: Arrangement] {
  causalAncestry[a]
  a.output in a.correctionSurvivesTraining
}

pred liveAnswerability[a: Arrangement] {
  a.target -> a.output in ^(liveEdges[a])
}

pred targetAccess[a: Arrangement] {
  some e: Evidence | a.target -> e in liveEdges[a]
}

pred detectability[a: Arrangement] {
  some e: Evidence, c: Check |
    e -> c in liveEdges[a] and a.candidate -> c in liveEdges[a]
}

pred checkingIndependence[a: Arrangement] {
  some a.independentChecks
}

pred attribution[a: Arrangement] {
  some a.attributableChecks
}

pred effectiveUptake[a: Arrangement] {
  some c: Check, u: Uptake |
    c -> u in liveEdges[a] and u -> a.output in liveEdges[a]
}

// A complete correction path follows the lower path in Figure 1. Evidence
// constrains the candidate and is compared with it before uptake affects output.
pred connectedCorrectionPath[a: Arrangement] {
  some e: Evidence, c: Check, u: Uptake |
    a.target -> e in liveEdges[a] and
    e -> a.candidate in liveEdges[a] and
    e -> c in liveEdges[a] and
    a.candidate -> c in liveEdges[a] and
    c in a.independentChecks and
    c in a.attributableChecks and
    c -> u in liveEdges[a] and
    u -> a.output in liveEdges[a]
}

pred allFiveFeatures[a: Arrangement] {
  targetAccess[a]
  detectability[a]
  checkingIndependence[a]
  attribution[a]
  effectiveUptake[a]
}

pred correctiveControl[a: Arrangement] {
  connectedCorrectionPath[a]
  allFiveFeatures[a]
}

// Satisfiability checks guard against proving implications vacuously.
pred showCorrectiveControl {
  some a: Arrangement | correctiveControl[a]
}

pred showGroundedWithoutControl {
  some a: Arrangement | grounded[a] and not correctiveControl[a]
}

pred showAncestryWithoutDerivativeAnswerability {
  some a: Arrangement | causalAncestry[a] and not derivativeAnswerability[a]
}

pred showDerivativeWithoutLiveAnswerability {
  some a: Arrangement |
    derivativeAnswerability[a] and not liveAnswerability[a]
}

pred showLiveAnswerabilityWithoutControl {
  some a: Arrangement |
    liveAnswerability[a] and not correctiveControl[a]
}

pred showFiveFeaturesWithoutConnectedPath {
  some a: Arrangement |
    allFiveFeatures[a] and not connectedCorrectionPath[a]
}

pred showControlWithACurrentlyWrongOutput {
  some a: Arrangement |
    correctiveControl[a] and a.output in a.currentlyIncorrect
}

assert CorrectiveControlRequiresLiveAnswerability {
  all a: Arrangement | correctiveControl[a] implies liveAnswerability[a]
}

assert CorrectiveControlRequiresAllFiveFeatures {
  all a: Arrangement | correctiveControl[a] implies allFiveFeatures[a]
}

// These assertions are expected to have counterexamples. They encode tempting
// entailments that the article rejects.
assert GroundingEntailsCorrectiveControl {
  all a: Arrangement | grounded[a] implies correctiveControl[a]
}

assert CausalAncestryEntailsDerivativeAnswerability {
  all a: Arrangement | causalAncestry[a] implies derivativeAnswerability[a]
}

assert DerivativeAnswerabilityEntailsLiveAnswerability {
  all a: Arrangement | derivativeAnswerability[a] implies liveAnswerability[a]
}

assert LiveAnswerabilityEntailsCorrectiveControl {
  all a: Arrangement | liveAnswerability[a] implies correctiveControl[a]
}

assert FiveFeaturesEntailCorrectiveControl {
  all a: Arrangement | allFiveFeatures[a] implies correctiveControl[a]
}

run showCorrectiveControl for 9 but exactly 1 Arrangement
run showGroundedWithoutControl for 9 but exactly 1 Arrangement
run showAncestryWithoutDerivativeAnswerability for 9 but exactly 1 Arrangement
run showDerivativeWithoutLiveAnswerability for 9 but exactly 1 Arrangement
run showLiveAnswerabilityWithoutControl for 9 but exactly 1 Arrangement
run showFiveFeaturesWithoutConnectedPath for 9 but exactly 1 Arrangement
run showControlWithACurrentlyWrongOutput for 9 but exactly 1 Arrangement

check CorrectiveControlRequiresLiveAnswerability for 9 but exactly 1 Arrangement
check CorrectiveControlRequiresAllFiveFeatures for 9 but exactly 1 Arrangement
check GroundingEntailsCorrectiveControl for 9 but exactly 1 Arrangement
check CausalAncestryEntailsDerivativeAnswerability for 9 but exactly 1 Arrangement
check DerivativeAnswerabilityEntailsLiveAnswerability for 9 but exactly 1 Arrangement
check LiveAnswerabilityEntailsCorrectiveControl for 9 but exactly 1 Arrangement
check FiveFeaturesEntailCorrectiveControl for 9 but exactly 1 Arrangement
