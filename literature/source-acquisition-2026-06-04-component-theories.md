# Component-Theory Source Acquisition, 2026-06-04

This pass filled the component-theory gap for the truth-tracking profile paper.
Files were stored in the shared literature directory:

`/Users/brettreynolds/Documents/LLM-CLI-projects/literature`

and symlinked back into this project's `literature/` directory.

## Acquired local text

Public-domain and open reference sources now available locally:

- `james_1907_pragmatism_gutenberg.html` / `.md` / `.txt`
  Source: Project Gutenberg, <https://www.gutenberg.org/ebooks/5116>.
- `james_1909_meaning_of_truth_gutenberg.html` / `.md` / `.txt`
  Source: Project Gutenberg, <https://www.gutenberg.org/ebooks/5117>.
- `peirce_1878_how_to_make_our_ideas_clear_peirceorg.html` / `.md`
  Source: Peirce.org transcription of *Popular Science Monthly* 12 (January 1878), 286--302, <https://www.peirce.org/writings/p119.html>.
- `sep_reliabilism.html` / `.md`
  Source: Stanford Encyclopedia of Philosophy, <https://plato.stanford.edu/entries/reliabilism/>.
- `sep_justep_coherence.html` / `.md`
  Source: Stanford Encyclopedia of Philosophy, <https://plato.stanford.edu/entries/justep-coherence/>.
- `iep_coherentism_epistemology.html` / `.md`
  Source: Internet Encyclopedia of Philosophy, <https://iep.utm.edu/coherentism-in-epistemology/>.
- `sep_testimony_episprob.html` / `.md`
  Source: Stanford Encyclopedia of Philosophy, <https://plato.stanford.edu/entries/testimony-episprob/>.
- `sep_epistemology_social.html` / `.md`
  Source: Stanford Encyclopedia of Philosophy, <https://plato.stanford.edu/entries/epistemology-social/>.
- `sep_scientific_knowledge_social.html` / `.md`
  Source: Stanford Encyclopedia of Philosophy, <https://plato.stanford.edu/entries/scientific-knowledge-social/>.
- `sep_truth_pragmatic.html` / `.md`
  Source: Stanford Encyclopedia of Philosophy, <https://plato.stanford.edu/entries/truth-pragmatic/>.
- `sep_truth_correspondence.html` / `.md`
  Source: Stanford Encyclopedia of Philosophy, <https://plato.stanford.edu/entries/truth-correspondence/>.
- `sep_truth_deflationary.html` / `.md`
  Source: Stanford Encyclopedia of Philosophy, <https://plato.stanford.edu/entries/truth-deflationary/>.

These are enough for drafting cautious orientation prose on reliabilism,
coherentism, pragmatism, testimony/social epistemology, correspondence, and
deflationism.

## Imported primary-source files

Brett supplied additional PDF/Markdown files in `~/Downloads` on 2026-06-04.
They were copied into the shared literature directory under stable filenames and
symlinked back here:

- `goldman_1979_what_is_justified_belief_reprint_arguing_about_knowledge.pdf` / `.md`
- `bonjour_1976_coherence_theory_empirical_knowledge_proquest.pdf` / `.md`
- `bonjour_1985_structure_empirical_knowledge.pdf` / `.md`
- `lackey_2008_learning_from_words.pdf` / `.md`
- `goldberg_2010_relying_on_others.pdf` / `.md`
- `fricker_2007_epistemic_injustice.pdf` / `.md`
  Note: the Markdown file was generated locally with `pdftotext` because Downloads contained only the PDF.
- `david_1994_correspondence_disquotation.pdf` / `.md`
- `lynch_2009_truth_one_many.pdf` / `.md`
- `kirkham_1992_theories_of_truth.pdf` / `.md`
- `goodman_1955_fact_fiction_forecast.pdf` / `.md`
- `horwich_1998_truth_ch01_minimal_theory.pdf` / `.md`
- `horwich_1998_truth_ch02_proper_formulation.pdf` / `.md`
- `horwich_1998_truth_ch03_explanatory_role_truth.pdf` / `.md`
- `horwich_1998_truth_ch04_methodology_scientific_realism.pdf` / `.md`
- `horwich_1998_truth_ch05_meaning_logic.pdf` / `.md`
- `horwich_1998_truth_ch06_propositions_utterances.pdf` / `.md`
- `horwich_1998_truth_ch07_correspondence_intuition.pdf` / `.md`
- `horwich_1998_truth_conclusion.pdf` / `.md`

The Horwich files are OUP chapter downloads, not a single whole-book PDF.

## Metadata-only local files

Springer exposed official metadata pages but not full PDFs:

- `goldman_1979_what_is_justified_belief_springer.html` / `.md`
  DOI: `10.1007/978-94-009-9493-5_1`.
- `bonjour_1976_coherence_theory_empirical_knowledge_springer.html` / `.md`
  DOI: `10.1007/BF00357928`.

Crossref DOI metadata is stored under:

- `literature/doi-metadata-truth-tracking-component-theories/`

That directory contains JSON for Goldman, BonJour, Coady, Lackey, Goldberg,
Fricker, James's Cambridge DOI edition, Peirce's reader reprint, Dewey, Horwich,
David, and Lynch.

## Added BibTeX entries

Project-local entries were added to `references-local.bib` for:

- `goldman_1979_what_is_justified_belief`
- `bonjour_1976_coherence_theory_empirical_knowledge`
- `bonjour_1985_structure_empirical_knowledge`
- `coady_1994_testimony`
- `lackey_2008_learning_from_words`
- `goldberg_2010_relying_on_others`
- `fricker_2007_epistemic_injustice`
- `james_1907_pragmatism`
- `james_1909_meaning_of_truth`
- `peirce_1878_how_make_ideas_clear`
- `dewey_1941_propositions_warranted_assertibility_truth`
- `horwich_1998_truth`
- `kirkham_1992_theories_truth`
- `david_1994_correspondence_disquotation`
- `lynch_2009_truth_one_many`

The existing central bibliography already has `Goodman1955`.

## Remaining missing target

Only Coady remains missing from the local source files:

- Coady, *Testimony*, DOI `10.1093/0198235518.001.0001`. Note: DOI metadata gives 1994; some library records may list an earlier first-publication date.

Convenient URLs:

- Coady, *Testimony*
  <https://doi.org/10.1093/0198235518.001.0001>
  <https://academic.oup.com/book/25355>

## Immediate citation use

For the current draft, the safest citation strategy is:

- Projectibility: `Goodman1955`, then Khalidi/Boyd for natural-kind projectibility.
- Reliabilism: `goldman_1979_what_is_justified_belief`; local reprint available.
- Coherentism: `bonjour_1976_coherence_theory_empirical_knowledge` and `bonjour_1985_structure_empirical_knowledge`; use SEP/IEP for orientation.
- Pragmatism: `james_1907_pragmatism`, `james_1909_meaning_of_truth`, `peirce_1878_how_make_ideas_clear`, and `dewey_1941_propositions_warranted_assertibility_truth`.
- Testimony/social epistemology: `lackey_2008_learning_from_words`, and, if needed, `goldberg_2010_relying_on_others` or `fricker_2007_epistemic_injustice`; use `coady_1994_testimony` only after the source file is acquired.
- Correspondence/deflationism: `david_1994_correspondence_disquotation`, `horwich_1998_truth`, and `kirkham_1992_theories_truth`; use SEP pages for orientation.
