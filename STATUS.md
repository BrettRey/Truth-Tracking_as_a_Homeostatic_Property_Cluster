---
slug: truth-tracking-profiles
kind: paper
title: 'Grounding Without Corrective Control: Truth-Tracking Profiles for Large Language Models'
stage: complete
external: preprint
blocked_on:
- submission-package
updated: 2026-08-11
source:
- STATUS.md
- PORTFOLIO.md
venue: Synthese
preprints:
- philarchive/REYTPW
next_action: Retitled `Grounding Without Corrective Control` and rebuilt to earn it; two review-board
  rounds run and worked through (unanimous R&R both rounds, desk-editor proxy now send-for-review).
  Next is Brett's read, then the submission package: the paper is NOT anonymised and has no Declarations
  section, which would bounce it before any argument is read.
notes: 'STATUS.md "Next actions": "1. Submit to Minds and Machines or adjust target if journal fit changes."
  No submission has been made yet (preprint only, PhilArchive REYTPW). PORTFOLIO.md:302 (Venue Coordination
  Flags, updated 2026-07-28): "Three papers point at Minds and Machines ... Delegation Assurance, Truth-Tracking
  Profiles ... and the AGI-evaluation paper ... all target M&M. ... These can''t all be under review at
  M&M at once; sequence them or retarget one before submitting." Classified blocked_on: brett-decision
  (which of the three to submit first, or whether to retarget one) rather than venue-decision, since the
  venue itself (M&M) is already chosen for this paper -- the open question is sequencing, a call only
  Brett can make. RESOLVED 2026-08-08: Brett gave the M&M slot to the AGI-evaluation paper and retargeted
  this one to Synthese (record at `submission/venue-decision-2026-08-08.md`). blocked_on is now
  manuscript work, not a Brett decision: the draft cites none of the four recent Synthese papers on its
  own topic, which is a desk risk at a journal whose guidelines require detailed engagement with current
  literature.'
---

# STATUS — Truth-Tracking Profiles

**Stage:** Preprint posted to PhilArchive. Reframed from strong HPC framing to
projectible-profile framing; final polished draft available as PhilArchive REYTPW.
**Last updated:** 2026-06-12

## What this is

A philosophy-of-AI/language paper arguing that truth-tracking successes are
stabilised by a projectible profile of partially coupled mechanisms, with LLM
grounding as the case that makes the profile visible. Boyd/HPC remains the
lineage and pressure point, but the manuscript now reserves `homeostatic` for
corrective coupling that has actually been shown, following
`Not_Every_Stable_Cluster_Is_Homeostatic`.
Third member of the HPC-to-LLM family alongside `hpc_to_vector` and
`vector-grounding-problem_response`. See `NOTES.md` for the full design brief and
`DECISIONS.md` for locked commitments.

## Done (this session, 2026-05-22)

- Scaffolded from house-style template; builds clean (`make` → main.pdf, exit 0).
- `references.bib` symlinked to central house-style bib (correct layout, not a stray file).
- `references-local.bib` seeded with 8 verified LLM-grounding entries (from sibling).
- `literature/` populated with 20 symlinks to key sources in central literature.
- `main.tex` retitled and given an 8-section argument skeleton encoding the design
  decisions (Section 1 = the non-relabeling argument; Section 5 = the load-bearing
  "what the profile framework does that component theories don't"; Section 7 = the
  LLM payoff).
- `NOTES.md`, `DECISIONS.md` written.

## Done (source pass, 2026-05-24)

- Downloaded 21 open PDFs and 3 encyclopedia pages into `literature/`, with Markdown
  companions for each.
- Added Brett-supplied Boyd 2019, Pepp 2025, and Hoffman 2016 PDF/Markdown pairs
  from `~/Downloads`.
- Ran the same converter used by the Downloads watcher
  (`opendataloader-pdf -f markdown`); it failed on the new PDFs, so generated
  fallback Markdown with `pdftotext -layout -nopgbrk`.
- Added `literature/source-acquisition-2026-05-24.md` cataloguing target sources,
  mined sources, conversion logs, and source gaps.

## Done (source hygiene and Boyd pass, 2026-05-24)

- Moved newly acquired PDFs/Markdown into the shared literature folder and replaced
  project-local copies with symlinks.
- Logged that move in `literature/centralization-log-2026-05-24.tsv`.
- Added verified local BibTeX entries for the new Boyd/LLM/truth-pluralism/natural-kind
  cluster; left central-bib duplicates (`slater2015`, `lemeire2018`) alone.
- Added `notes/boyd_2019_source-note.md` with the non-relabeling constraint:
  the paper's contribution cannot be "truth is accommodated" in general; it has to
  be the LLM mechanism-profile diagnosis.

## Done (drafting, 2026-05-24)

- Drafted Section 1 (promissory intro) in prose: binary-presupposition opening, thesis
  (truth-tracking as a causally coupled profile), Boyd-lineage acknowledgement, the
  relabeling worry stated openly, and the three-part answer led by the failure signature
  (hallucination). Roadmap with \ref cross-refs.
- Sketched Section 5 spine (adjudication + domain-clustered co-variation) with the
  prior session's anti-relabeling/anti-circularity guardrails preserved as TODOs.
- Drafted the then-current HPC-inside-NCN framing (now superseded by the 2026-06-03
  reframe): NCN-positioning paragraphs opening Section 3 and Section 5's two moves in
  graph-connectivity terms. Added verified Khalidi 2018 + 2023 entries to references-local.
- Added \label to all sections; build clean (`make`, exit 0), no undefined refs/cites.

## Done (reframe, 2026-06-03)

- Retitled the manuscript to `Truth-Tracking Profiles: What LLMs Participate In`.
- Reframed the live thesis away from "truth-tracking is a homeostatic property
  cluster" toward "truth-tracking successes are stabilised by a projectible
  profile of partially coupled mechanisms."
- Added `reynolds2026notEveryStableCluster` as the methodological citation for
  reserving `homeostatic` for cases where corrective coupling has been shown.
- Renamed Section 3 to `Truth-tracking as a projectible mechanism profile`,
  Section 4 to `Why the profile is projectible`, and Section 5 to `What the
  profile structure does that component theories don't`.
- Created `notes/truth-tracking-reframe-plan.md` as the Roughdraft checkpoint;
  Roughdraft timed out locally before returning a clean Done Reviewing signal, and
  the Markdown file contained no CriticMarkup comments or suggestions.

## Done (LLM payoff and inverse-paper split, 2026-06-04)

- Drafted the abstract, target section, projectibility section, objections, LLM payoff
  section, and conclusion.
- Added Section 7's mechanism-by-mechanism LLM profile: text-only, instruction-tuned/RLHF,
  retrieval, tools, multimodal systems, and action-guided or expert-reviewed systems.
- Added participation taxonomy: inherited, operational, corrective, and decorative.
- Engaged Coelho Mollo and Millière directly: referential grounding may hold while
  truth-tracking answerability remains profile-dependent.
- Strengthened the non-relabeling reply with the prediction/transfer point and
  architecture-sensitive failure signatures.
- Added a light inverse framing to Paper 1: LLMs make single-stabiliser theories of
  truth-tracking look too simple, while preserving the LLM-grounding spine.
- Created `subprojects/llms-truth-theories/` as the incubator for the second paper,
  with README, status, outline, source ledger, and draft notes.
- Applied central house-style prose pass to `main.tex` and the second-paper scaffolding,
  with special attention to contractions, linking words, paragraph length, and direct
  statement of claims.
- Rebuilt `main.pdf` successfully after the style pass.
- Shipped commit `c8f7878` (`Complete truth-tracking LLM payoff`) before the inverse
  hook/subproject setup pass.

## Done (preprint, 2026-06-12)

- Posted the polished preprint to PhilArchive:
  <https://philarchive.org/rec/REYTPW>.
- Updated the paper title to `Truth-Tracking Profiles: What Large Language Models
  Participate In`.
- Updated portfolio, website, and CV tracking surfaces with the PhilArchive link.

### 2026-06-12 Session Notes

- Finalised submission-facing polish after review comments: OED `true` footnote,
  Russell/coherence-theory paragraph, Geoff acknowledgement, abstract/table/footnote
  fixes, and final PDF build.
- Posted the preprint at PhilArchive REYTPW and shipped paper repo commit `aa209a2`.
- Updated public tracking: website publication entry, generated Markdown/BibTeX
  mirror at `papers/truth-tracking-profiles/`, rebuilt website CV PDF, updated CV
  source and portfolio tracking on disk, and added central-bib entry
  `reynolds2026truthTrackingProfiles`.
- Shipped website commit `66c662b`, including the Truth-Tracking mirror plus
  user-authorised unrelated dirty files.

## Venue retarget (2026-08-08): Minds and Machines → Synthese

The M&M slot went to the AGI-evaluation paper (`papers/retarget/agi-evaluation`),
resolving the three-way collision flagged at `PORTFOLIO.md:302`. This paper is
retargeted to *Synthese*. Full record: `submission/venue-decision-2026-08-08.md`.

Why Synthese: it owns the live LLM-metasemantics debate this paper enters (236
works since 2025 match "large language models"; Grindrod 2024, Ruyant 2026,
Attah 2025, and Havlík 2024 are all directly on the question), and it published
Khalidi's causal-network projectibility apparatus that the paper runs on.
Mind & Language and PhiMiSci were both excluded by live Reynolds submissions.

**Submission is blocked on one thing.** `main.tex` cites none of those four
Synthese papers, nor Pepp 2025, Mandelkern & Linzen 2024, or Lederman &
Mahowald. Synthese's guidelines require manuscripts to "engage in detail with
and contribute substantially to the relevant current philosophical literature."
The gap is a desk risk, and closing it also strengthens the anti-relabeling
reply, since Grindrod's linguistic-intentionality account and Havlík's semantic
fragmentism are the nearest rivals to the profile view.

## Next actions

Reading done 2026-08-08 (notes in `notes/`): Grindrod, Havlík, Mandelkern &
Linzen, Ruyant, Attah all read; Pepp read to §1 only. Bib entries verified
against Crossref and in `references-local.bib`. Nothing is blocked on
acquisition. What remains is drafting:

1. **New §6 objection-and-reply: Ruyant's fictionalism.** If LLM outputs are
   props in make-believe, auditing them for truth-tracking is a category error.
   Answer with his own performativity clause: generated text becomes real text
   when a human appropriates it, and answerability bites at that transition,
   which he leaves unanalysed. Frame as extension, not refutation.
2. **Turn the §7 RLHF passage into an adjudication** between Grindrod
   (fine-tuning marginal) and Ruyant (constitutive of the representational
   target). The profile view dissolves the disagreement: each is right about a
   different stabilizer.
3. **Footnote at first use of `stabilizer`** distinguishing it from Millikan's
   *stabilizing function*, which Grindrod uses throughout a *Synthese* paper on
   this topic, then turn the distinction into an argument.
4. **One concession sentence citing Grindrod, Mandelkern & Linzen, Pepp and
   Attah together**, granting meaning/reference/intention and relocating the
   question to answerability.
5. **Engage Havlík at the existing Russell-on-coherence passage**; semantic
   fragmentism is the pure coherence-only limiting case.
6. **Build the Izzy foil into §7** (Mandelkern & Linzen's sensory-deprivation
   case: he refers, and he cannot check anything).
7. Closer pass on Pepp before citing beyond her abstract's thesis.
7a. **Bearer fix (from the AGI-evaluation cross-check, 2026-08-08).** `projectible
   profile` attaches a warrant predicate to a worldly object, which canon forbids:
   "The primary bearer of projectibility is a bounded projective claim, not a
   predicate or category in isolation. Its warrant is distinct from both the worldly
   source--target profile and any proposed causal ground"
   (`projectibility-history-and-prospects`, 41--49). Two occurrences: `main.tex` line
   67 and the §3 section title (line 210). Make the bearer a claim about what the
   profile licenses. **The paper title is fine** ~-- bare `profile` is canon's own word
   for the worldly relation, so TTP's 102 uses are correct and it is the sibling's
   score-vector sense that departs.
7b. **§7 convergence-vs-composition sentence.** Separate studies of each intervention
   would evidence the transfer predictions by convergence, not composition, and
   convergent evidence passes no result forward as a premise. Name the relation
   claimed. (Sister session's Equation 1 point; its non-composition principle is
   warrant-side, TTP's prediction world-side, so TTP is not a special case of it.)
7c. **Optional new material, offered by the sister session:** the division of
   evidential labour between developer and deployer may be *forced* by which
   stabilizing routes the deployed system participates in. World-side, so TTP's to
   make if it survives drafting. ⚠ Its caution, and it is the useful half: that
   division is *partly institutional* (privilege, proprietary lineage, contract). A
   firm cannot see training overlap for reasons unrelated to stabilizer
   participation. Routes explain part, not all; state the institutional residue or
   the claim overreaches.
7d. **`\term{}`-mark `profile` and `stabilizer` at first use.** Canon `\term{}`-marks
   `profile` as the worldly relation (lines 159, 735); TTP uses it in that sense 102
   times and marks it zero times (only `truthbearers` and `answerability` are
   marked). One edit fixes the canon alignment and gives the Millikan
   `stabilizing function` disambiguation a natural home. Do this regardless of how
   Brett rules on the canon-register question (whether canon keeps bare `profile` or
   reserves a qualified form); the marking is house style either way.
7f. **Adopt canon's "degree of warrant for a bounded extension"** where the paper
   discusses warrant strength; TTP currently uses the phrase zero times. This is the
   only live residue of the `link`/`projection` rename question, which was checked
   2026-08-08 and found already settled: the `check-projectibility` skill uses
   `projection` 20 times and `link`/`edge-level` zero, and TTP's 12 apparent `link`
   hits are ordinary English. The sibling's 2026-07-23 note to the contrary is stale.
7e. **Preprint dependency (needs Brett).** The sister paper wants TTP's
   defeater-generator for its §7.2 step 4 and §8, and rightly won't import it with
   nothing to cite. But the generator is not in TTP: it is a synthesis of the
   retrieval-augmented clinical-guidelines passage (`main.tex` 439--451), not a
   stated principle, and PhilArchive REYTPW is the pre-Synthese version. Order:
   (1) write the generator in explicitly, (2) refresh the preprint, (3) the sibling
   cites it. With M&M likely faster than Synthese, refreshing the preprint early
   rather than at submission is worth considering.
8. **§3/§4/§5 audit (2026-08-08): the correction account exists but is in the wrong
   sections.** A first pass over §4 alone concluded the paper had no correctibility
   notion and no anchoring condition. Checking §3 and §5 refuted both halves of that.

   **What is already there.** §5 lines 431--437 draw the distinction outright:
   "Reliability is a statistical property of a process; answerability is a
   counterfactual property of a network," with the detection clause ("standards,
   logs, and downstream checks already specify how discrepancies would show up").
   §5 lines 495--498 supply the anchoring/independence condition: agreement "inherited
   from a shared mistake" or from "one copied source" differs evidentially from
   agreement among "independent, mutually correcting routes," cited to Bovens &
   Hartmann and Olsson. §3 line 250 gives the informal definition ("practices that
   make error detectable and revision possible maintain it") and the fever example
   (252--255) works it through.

   **The actual defect is architectural.** Per-section counts: `answerab*` 4/1/8,
   `reliab*` 2/0/27, `independen*` 0/1/5, `check` 0/0/7, `detect*` 2/0/0, `revis*`
   2/0/0, against `perturb*` 1/6/2 and `stab*` 6/12/19 (§3 96 lines, §4 84, §5 190).
   §4 is where stability and perturbation peak and where every correction term
   bottoms out; it runs on Pearl/Woodward invariance instead. So the section titled
   "Why the profile is projectible" establishes the weaker property, and the paper's
   best statement of its central concept sits in §5, a section framed as comparison
   with component theories, arriving after a referee has already asked "isn't this
   just stability?" and after §3 (263--267, citing `reynolds2026notEveryStableCluster`)
   has promised the distinction.

   **Fix is relocation, not invention.** Move or forward-reference the §5 431--437
   answerability/reliability distinction and the 495--498 independence condition into
   §4, so §4 delivers what its title claims and §7 has its premise in hand. Cheaper
   than the new-subsection plan this item previously recommended.

   **Cheaper still (found 2026-08-08 via the AGI-evaluation cross-check): the
   programme already owns the specification.** `papers/drafting/projectibility-history-
   and-prospects/main.tex` line 567: "**Corrective control** adds detection and
   effective correction to a maintenance claim. It requires a detected departure from
   a reference range or trajectory, a stated higher-scale relation, and an admissible
   perturbation range," within a partial order (stability and directed dependence
   incomparable; maintenance includes both; corrective control adds detection and
   correction; lines 47--49, 863--872). That names the §4/§7 gap exactly ~-- §4 sits at
   stability, §7 spends corrective control ~-- and supplies the vocabulary. **TTP cites
   none of it** (zero hits for corrective control / maintenance / securing ladder; one
   `reynolds2026notEveryStableCluster` at line 267). So the fix is to cite canon and
   place the profile on the order. See `notes/agi-evaluation-cross-paper-note.md`.
9. **Consider making the correction gap the paper's headline contribution.**
   ⚠ Scope the negative claim before drafting it. Two corrections, both from checks
   run 2026-08-08.

   (a) The paper itself cites Bayesian witness-independence work (Bovens & Hartmann,
   Olsson) bearing directly on correction, so "no one has a correction notion" is
   false about epistemology at large.

   (b) Grindrod is a real partial exception and must be credited, not waved at.
   Evans's producers hold "causal-informational channels open to the object" and the
   practice "gets updated" through them; Grindrod says outright that this is where
   "the relation between word and world is maintained," and that LLMs are excluded.
   What saves the claim is that the maintenance is of **reference, not truth**:
   Evans's practice explicitly tolerates information "not true of the object." So the
   defensible formulation is that none of the five supplies an account of how a
   practice **detects and repairs error about the world**, the nearest precedent being
   Evans's producers, who maintain reference while tolerating falsehood. Grindrod's
   whole-paper counts back this up: `error` 0, `reliab*` 0, `check` 0, `calibrat*` 0,
   `drift` 0, `revis*` 0; `maintain` 1, `update` 1.

   **Better move available.** Grindrod (914--921) notes Evans's concession that
   influential consumers *can* change a naming practice, and applies it to LLMs, then
   drops it. That is influence without anchoring, and it converges with Ruyant's
   performativity clause. Taking the loop he leaves open handles Grindrod and Ruyant
   with one mechanism and is stronger than answering either. See
   `notes/grindrod_2024_source-note.md`.

   **Madagascar resolved; no acquisition blocking.** The case is **Evans 1973, "The
   Causal Theory of Names," *Proc. Aristotelian Society* 47** ~-- a journal article, not
   the 1982 book, which Grindrod's "Evans (1973, 1982)" obscures. Pepp 2025, already
   in the corpus and on our exact topic, states it precisely and is the better
   citation for an LLM paper: the name passed from a Malay sailor (referring to part
   of the African mainland) to Marco Polo (the island), with reference-preserving
   intentions throughout, and "reference was not preserved." Maintenance without
   error-detection, which is the point §6 needs. ⚠ Carry Pepp's caveat: Evans's
   compressed story "is not historically accurate," so use it as illustration, never
   as history. *Varieties of Reference* (1982) stays optional (borrow-only on Internet
   Archive, `varietiesofrefer0000evan`); needed only to quote the producer/consumer
   machinery directly, which is the weaker citation here than Grindrod. Also
   acquired and filed, probably surplus: `literature/derosset_2020_reference_switch_
   and_bad_dubbings.{pdf,md}`.
   Nothing is right about the world 100% of the time, so accuracy cannot be
   what separates representing the world from not representing it; what
   separates a thermometer from a hallucinating chatbot is calibration, a route
   by which errors are caught. Truth-tracking is correctibility, not
   correctness. Across all five rivals read on 2026-08-08, none has a
   correction notion (Ruyant: `reliab*` 0, `calibrat*` 0, yet his ethics needs
   LLMs to be "fundamentally untrustworthy"). The one partial precedent is
   Grindrod's Evansian producers, who hold the causal channels that maintain a
   naming practice; credit it rather than claiming a clean sweep. See the
   amendment in `notes/ruyant-attah_source-note.md`.
3. Run `.house-style/check-terms.py`; record the free/earned split into `planning/terms.md`.
4. Build the anonymized Synthese package, then run `/submission-gate` including
   the quote-verification step.
5. Keep PhilArchive as the canonical preprint URL in future correspondence and CV entries.
6. For Paper 2, complete a truth-pluralism/functionalist source pass before drafting.

## Literature hook: Groeger, Wen, and Brbic (2026)

Central note: `../../../literature/groeger_wen_brbic_2026_aristotelian_representation_hypothesis.notes.md`.

Use in any pre-submission revision only if it helps the LLM-local-coherence point. Their calibrated result says local neighbourhood alignment can persist after global spectral convergence is deflated. That is a good technical analogue for this paper's distinction between local coherence and answerability: local representational order can support fluent continuation without supplying perception, verification, measurement, or world-directed correction.

## Not yet done

- Full source reading is not done beyond the Boyd-first pass; Pepp, Grindrod, Mallory,
  Martinez, Hoffman, and the truth-pluralism cluster still need reading notes before
  heavy citation in prose.
- Current Paper 2 subproject is an incubator, not yet a full LaTeX article draft.
