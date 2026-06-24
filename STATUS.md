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

## Next actions

1. Submit to *Minds and Machines* or adjust target if journal fit changes.
2. Keep PhilArchive as the canonical preprint URL in future correspondence and CV entries.
3. For Paper 2, complete a truth-pluralism/functionalist source pass before drafting.

## Not yet done

- Full source reading is not done beyond the Boyd-first pass; Pepp, Grindrod, Mallory,
  Martinez, Hoffman, and the truth-pluralism cluster still need reading notes before
  heavy citation in prose.
- Current Paper 2 subproject is an incubator, not yet a full LaTeX article draft.
