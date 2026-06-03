# Source acquisition, 2026-05-24

This pass targeted the sources flagged in `NOTES.md`, then did one reference-mining round across the truth-pluralism, natural-kinds/HPC, and LLM-grounding literatures.

After acquisition, the source PDFs/Markdown were moved into the shared literature
folder at `/Users/brettreynolds/Documents/LLM-CLI-projects/literature` and symlinked
back here. The project-local `literature/` directory should now contain symlinks for
source files plus local acquisition/conversion logs.

## Conversion note

The local Downloads trigger runs `/Users/brettreynolds/bin/pdf-to-md-watcher.sh`, which calls:

```bash
/Users/brettreynolds/Library/Python/3.11/bin/opendataloader-pdf -f markdown
```

I ran that same converter against the downloaded PDFs. It failed on the new PDFs with return code `-6`, so I fell back to `pdftotext -layout -nopgbrk` for the Markdown companions. The HTML sources were converted with `pandoc`.

Logs:

- `download-log-2026-05-24.tsv`
- `conversion-log-2026-05-24.tsv`
- `pdftotext-fallback-log-2026-05-24.tsv`
- `opendataloader-2026-05-24.log`
- `centralization-log-2026-05-24.tsv`

## Acquired target sources

- `boyd_2019_rethinking_natural_kinds_reference_truth.pdf` / `.md`
- `martinez_2019_usefulness_drives_representations_to_truth.pdf` / `.md`
- `grindrod_2024_large_language_models_linguistic_intentionality.pdf` / `.md`
- `mallory_2026_teleosemantics_for_neural_word_embeddings.pdf` / `.md`
- `hoffman_2015_interface_theory_perception.pdf` / `.md`
- `hoffman_2015_interface_theory_perception_springer.pdf` / `.md`
- `hoffman_2016_interface_theory_perception_current_directions.pdf` / `.md`
- `pedersen_2012_recent_work_on_alethic_pluralism.pdf` / `.md`
- `pepp_2025_reference_without_intentions_llms.pdf` / `.md`
- `sep_pluralist_theories_of_truth.html` / `.md`
- `iep_pluralist_theories_of_truth.html` / `.md`
- `sep_natural_kinds.html` / `.md`

## Acquired mined sources

- `gamester_2021_shopping_for_truth_pluralism.pdf` / `.md`
- `price_2023_global_expressivism_and_alethic_pluralism.pdf` / `.md`
- `alethic_pluralism_role_reference_metaphysics_truth.pdf` / `.md`
- `wyatt_lynch_2016_from_one_to_many_recent_work_on_truth.pdf` / `.md`
- `pedersen_2006_mixed_inferences_alethic_pluralism.pdf` / `.md`
- `slater_2015_natural_kindness.pdf` / `.md`
- `brigandt_2020_kinds_without_natural_kinds.pdf` / `.md`
- `crane_2021_two_approaches_to_natural_kinds.pdf` / `.md`
- `magnus_2015_taxonomy_ontology_natural_kinds.pdf` / `.md`
- `khalidi_2015_natural_kinds_crosscutting_categories.pdf` / `.md`
- `lemeire_2018_no_purely_epistemic_theory_naturalness_kinds.pdf` / `.md`
- `bender_gebru_mcmillan_major_mitchell_2021_stochastic_parrots.pdf` / `.md`
- `chalmers_2024_thought_sensory_grounding_llms.pdf` / `.md`
- `piantadosi_hill_2022_meaning_without_reference_llms.pdf` / `.md`
- `merrill_wu_naka_kim_linzen_2024_semantics_next_word_prediction_entailment.pdf` / `.md`

## Manually supplied after initial pass

Brett supplied the initially blocked Boyd, Pepp, and Hoffman PDFs plus generated
Markdown files in `~/Downloads`; these were imported under stable filenames on
2026-05-24 and then centralized with the rest of the source set.

## Next bibliography work

Initial verified BibTeX entries were added to `references-local.bib` on 2026-05-24.
Do not treat that as permission to cite deeply from every item yet: Boyd has a focused
source note, but the rest of the new source set still needs reading notes before heavy
use in prose.
