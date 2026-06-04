# NOTES — Truth-Tracking Profiles

Design brief. Synthesised from three pre-drafting assessments (2026-05-22). This is
the working spec; `DECISIONS.md` records the commitments, `STATUS.md` the state.

## One-line thesis

The representational successes picked out by the predicate *true* are stabilised by
a projectible profile of partially coupled mechanisms; LLMs are the case that makes
a profile-theoretic account necessary, by turning "are vectors grounded?" into
"which truth-stabilising mechanisms do they participate in, how directly, and with
what failure profile?"

## Reframe checkpoint (2026-06-03)

Do **not** frame the live manuscript as "truth-tracking is a homeostatic property
cluster." Following `Not_Every_Stable_Cluster_Is_Homeostatic`, stable or
projectible profiles should not automatically be called homeostatic unless
corrective coupling has been shown. Boyd/HPC remains the lineage and the pressure
point; the positive machinery is now a projectible mechanism profile around
truth-tracking successes, with variable coupling across domains and systems.

## Which version to write

| Version | Originality | Publishability | Main risk |
|---|---|---|---|
| "Truth itself is an HPC kind" (general theory of truth) | High | Medium-low | Referees demand math/logical/moral/fictional/legal/deflationary truth; "what are the members?" |
| "Empirical truth-tracking is a projectible mechanism-profile phenomenon" | Med-high | High | Less grand, much more defensible |
| **"LLM grounding is partial participation in truth-stabilising mechanisms"** | **High** | **High** | **Best fit: phil of AI / language / science. ← CHOSEN** |
| "Alethic pluralism naturalised via projectible profiles" | Med-high | Medium | Needs careful positioning vs Lynch/Wright/Pedersen |

Chosen: the LLM-centred version, with the projectible truth-tracking-profile
machinery as the engine and the LLM payoff load-bearing (not a tacked-on
application). The winning article is not "here is the true metaphysics of truth"
but "the grounding debate needs a profile-theoretic account of truth-tracking, and
LLMs make the need visible."

## The test the paper must pass (the relabeling worry)

A sharp referee leads with: *isn't this just relabeling?* Reliabilism already says
true beliefs come from reliable mechanisms; coherentism says truth is coherence;
pragmatism says truth is what works; social epistemology says testimony/institutions
matter. Stringing these together and calling the result "homeostatic" adds nothing
(~0.6 a hostile referee closes the file here).

The honest test: **name a question the truth-tracking-profile view answers that no
component theory answers.**
If you can't, the worry wins. Three candidates, increasing confidence:

1. **Mechanism-conflict adjudication (~0.6).** When perception and scientific
   testimony diverge, reliabilism shrugs (both reliable), coherentism collapses the
   conflict into one calculation, pragmatism picks the action-guiding one. The
   profile view says the mechanisms co-vary enough to project in many cases, and
   divergence poses a
   substantive empirical question: which mechanism's output projects better into the
   shared target. A structural move, not a relabel.
2. **Domain-clustered co-variation prediction (~0.55, shakiest).** If truth-tracking
   successes are stabilised by a projectible profile, mechanisms co-vary tightly where jointly
   selection-disciplined (everyday perception, basic coordination) and loosely where
   not (theoretical physics, ethics, large-number maths). Testable in a soft sense:
   does epistemic disagreement cluster where the mechanisms haven't been mutually
   disciplined? If the pattern fails, the proposal is in trouble.
3. **LLM-grounding reframing (~0.7, stake the paper here).** Component theories give
   binary verdicts (reliable? cohere? correspond?) that argue forever. The profile
   view dissolves the binary: LLMs participate in some truth-mechanisms (testimony aggregation,
   internal coherence) and not others (perception, scientific verification,
   selection-tested goal achievement). The work is specifying which, how much, what
   follows. A research programme, not a verdict.

Net: ~0.5 the paper survives this test in its current form; ~0.7 if the LLM payoff is
built into the load-bearing argument, not left as an application. **This must be
answered in Section 1, not left implicit. Anticipate the referee report there.**

### Claude's read (2026-05-22; reframed 2026-06-03) — coupling is the whole game

The one thing the profile view adds over "alethic pluralism + degrees of grounding"
is the **causal coupling** of the mechanisms: perception disciplines testimony,
verification disciplines coherence, practical success disciplines all of them. If
the mechanisms are a mere heterogeneous list that happens to co-occur, the
relabeling worry wins outright. If they are causally coupled, a projectible-profile
framework is doing real work. Homeostasis names the strongest case, not the umbrella
label. So Section 1's job is not just to "name a question the profile answers" -- it
is to **establish the coupling**, because coupling is what generates both the
adjudication leverage and the failure-signature prediction below.

Re-rating the three candidates:

1. **Adjudication — weaker than 0.6 (I'd say ~0.4 as stated).** "Which mechanism's
   output projects better into the shared target" is dangerously close to a
   reliabilist's "which mechanism is more reliable in this domain." Profile talk
   supplies a vocabulary, not an adjudication procedure reliabilism lacks. It only
   escapes relabeling if the *degree of inter-mechanism co-variation* is itself made the
   evidence (tight co-variation → trust any one mechanism more; divergence → a
   first-order signal that the kind is breaking down here). Make the co-variation
   epistemically load-bearing or drop this move.
2. **Domain-clustered co-variation — higher ceiling than 0.55, but a circularity
   trap.** This is the most genuinely profile-specific claim (component theories
   posit one mechanism each, so they can't predict a cross-domain co-variation
   *pattern*). The real threat isn't shakiness, it's circularity: don't define
   "jointly disciplined" by "they agree." Need an *independent* characterisation
   (shared selection history, institutional age, measurement infrastructure) that
   THEN predicts where disagreement clusters. If you get that, it's a real result.
3. **LLM reframing — safest, but "grading/profile" alone is not enough.** The
   sibling (vector-grounding-problem_response) already argues grounding is a graded
   profile. To earn this paper's machinery and not redo the sibling, use what coupled
   truth-tracking profiles give: the **characteristic failure signature**. Prediction:
   a system participating in the testimonial + coherence stabilisers but not the
   perceptual + verificational ones should produce a specific, predictable error
   profile — confident, fluent, internally coherent claims that echo
   training-corpus consensus but have no world-contact. That is exactly
   *hallucination*. "Hallucination is the predicted failure signature of a system
   with testimony + coherence but without perception + verification" is a real,
   novel, non-relabeling result, and it is stronger than the assessments realised.
   This, not bare gradedness, is the load-bearing LLM payoff.

## Mechanism participation (humans/science vs LLMs)

| Mechanism | Human/scientific truth role | LLM participation |
|---|---|---|
| Perception | Causal contact with environment | Absent text-only; partial multimodal |
| Testimony | Inheritance from other knowers | Very strong but indirect (pretraining = textual inheritance, not first-person contact) |
| Coherence | Inferential integration, contradiction pressure | Strong locally, weak under long-range / adversarial pressure |
| Verification | Measurement, intervention, reproducibility | Mostly absent unless tool-using / retrieval-augmented / in a verification loop |
| Feedback/selection | Error-correction via action, inquiry, social response | RLHF/fine-tuning add selection, but toward helpfulness/safety/fluency/preference, not truth alone |
| Practical success | Robust goal achievement | Weak chat-only; stronger for agents, tool-users, robotics, VLA |

Connect to Mahowald et al. (2024): formal linguistic competence (strong in LLMs) vs
functional competence (uneven, depends on fine-tuning / external modules).

## Projectibility commitment

Make **goal achievement under counterfactual perturbation** the central
projectibility story; survival/reproduction is one *limiting biological case*, not
the whole explanation. Reason: Hoffman-style "fitness beats truth" (Interface Theory
of Perception) targets any "truth because reproductive fitness" story. Martinez
("usefulness drives representations to truth", a family of counterexamples to
Hoffman) helps, but shows the usefulness-truth relation must be *modelled*, not
asserted. In science, testimony, engineering, medicine, law, and LLM eval the
coupling is institutional / technological / task-relative.

## The category-error pre-empt (settle early)

Projectible profiles need members, and truth is usually a property of truthbearers /
a device / a norm / a relation / a deflationary schema -- not obviously a kind with
members. Settle the target in Section 2: members are *representational successes*
(beliefs, utterances, inscriptions, measurements, models, inferential outputs)
standing in robust world-involving / inferential / testimonial / corrective /
action-guiding relations. The relations stabilise the *extension* of truth-ascription
and explain its projectibility; they don't individually define truth. This blocks
deflationism, pragmatist reduction, and crude evolutionary debunking in one move.

## Novelty claim (defensible form)

NOT "teleosemantics can't extend to LLM vectors" (refuted: Coelho Mollo & Millière,
Mandelkern & Linzen, Grindrod, Mallory all argue LLM states satisfy *some* grounding
conditions). INSTEAD: existing teleosemantic / externalist / inferentialist /
distributional / coherence approaches each isolate one stabiliser; a coupled-profile
account explains why LLM semantic status is partial, uneven, and empirically gradable
across mechanisms. Present as a *development of Boyd's programme* (he treats
reference and truth as "accommodation" between signalling practice and causal
structure), not a new doctrine -- pre-empt the "this is just Boydian naturalistic
epistemology" reply.

## Contribution boundary (vs the two siblings)

- `hpc_to_vector` — general HPC/SPC-to-embedding ontology framework.
- `vector-grounding-problem_response` — narrow reply to Coelho Mollo & Millière;
  *referential grounding* as a graded "groundedness profile", not binary.
- **This paper** — broader target: *truth-tracking* (not just reference), plus the
  adjudicative + predictive work the coupled profile structure does that component
  theories can't. Do NOT re-run the sibling's grounding-profile argument; generalise
  from reference to truth-tracking and earn the profile machinery via Section 5.

## Venues

LLM-centred version: *Philosophy & Technology*, *Minds and Machines*, *Synthese*,
*Inquiry*, *Mind & Language*, *Philosophy and the Mind Sciences*.
Natural-kinds/truth version (if it drifts that way): *Synthese*, *Erkenntnis*,
*Philosophy of Science*, *EJPS*, *Philosophical Studies* — but those need heavy
treatment of deflationism + math/logical/moral/fictional truth.

## Sources to acquire/verify (UNVERIFIED LEADS — read before citing; source-grounding LAW)

Identifiers below are from the pre-drafting assessments, NOT verified against the
source. Confirm bibliographic data by reading before adding to references-local.bib.

- Boyd, "Rethinking natural kinds, reference and truth" — THE priority threat; closest
  ancestor. Find + read (PhilPapers BOYRNK-2). Foreground the lineage.
- Truth pluralism — SEP "Pluralist Theories of Truth"; Lynch / Wright / Pedersen.
- Hoffman, "The Interface Theory of Perception" (fitness-beats-truth).
- Martínez, "Usefulness Drives Representations to Truth: A Family of Counterexamples
  to Hoffman's Interface Theory" (PhilArchive MARUDR-3). NB: distinct from the
  martinez_2017 "stable property clusters" paper already in literature/.
- Mallory, teleosemantics for neural word embeddings (forthcoming *Mind & Language*).
- Grindrod, "Large language models and linguistic intentionality" (*Synthese*,
  10.1007/s11229-024-04723-8).
- Mandelkern & Linzen, "Do Language Models' Words Refer?" — PDF IS in literature/
  (mandelkern_linzen_2024_do_lm_words_refer_acl); verify + add entry when cited.

## Sources already available

- references.bib (symlink → central): boyd1989/1991/1999/1999b, bender2020,
  mahowald2024, millikan1984/1999/2017, Millikan2005.
- references-local.bib (verified, from sibling): Coelho Mollo & Millière 2026 (VGP),
  Harnad 1990, Pavlick 2023, Williams (fc), Manheim 2026, Shea 2018, Neander 2017,
  Clark & Wilkes-Gibbs 1986.
- literature/ symlinks: bender_koller_2020, boyd1990/1991/1999, VGP (arXiv 2304.01481),
  mahowald-etal-2024, mandelkern_linzen_2024, martinez_2017 (SPC), millikan_1990,
  millikan2017-ch1.
