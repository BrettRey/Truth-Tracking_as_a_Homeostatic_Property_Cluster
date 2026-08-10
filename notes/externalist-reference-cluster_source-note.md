# Source Note: the externalist-reference cluster (Mandelkern & Linzen 2024; Pepp 2025)

Read 2026-08-08 for the Synthese retarget literature pass. Grouped because they make the same structural move and should be cited together rather than serially.

Sources:

- Matthew Mandelkern and Tal Linzen, "Do Language Models' Words Refer?" *Computational Linguistics* 50(3): 1191--1200 (2024). DOI 10.1162/coli_a_00522. CC BY-NC-ND. Local: `literature/mandelkern_linzen_2024_do_lm_words_refer_acl.md`.
- Jessica Pepp, "Reference without intentions in large language models," *Inquiry*, published online 9 January 2025. DOI 10.1080/0020174X.2024.2448482. Open access, CC BY. Local: `literature/pepp_2025_reference_without_intentions_llms.md`. (Read: abstract and §1. The rest is skimmed, not read closely; do not attribute anything below §1 to Pepp without a further pass.)

## The shared move

Both argue that reference is secured by a word token's **natural history** in a speech community, not by the speaker's beliefs, experiences, discriminatory capacities, or intentions. Both then observe that this removes the obvious obstacle to LLM reference.

Mandelkern & Linzen: "LMs' inputs are not bare strings of symbols, but strings of symbols with certain natural histories that connect them to their referents" (line 17). Their Luke case: Luke's only belief about Peano is a false one, he cannot distinguish Peano from Gödel, and his use of "Peano" still refers to Peano (lines 62--68).

Pepp sharpens the same picture against the intention requirement. Her abstract: "in applying the historical picture of reference to LLMs we need not and should not focus on the plausibility of ascribing linguistic intentions to LLMs. Instead, the critical issue is whether LLMs can achieve a kind of basic reference that is prior to and independent of propositional attitudes such as intentions."

Together with Grindrod 2024 (see `grindrod_2024_source-note.md`), that is **three independent recent papers converging on: meaning and reference can be inherited from a pre-existing system without mental states.** The draft currently engages none of them.

## Why this cluster helps rather than threatens the paper

It supplies the concession the argument needs, from authorities the referee pool respects. The paper's move is to grant world-connection at the level of reference and relocate the question to answerability. That move is much stronger when the granting cites the people who established it.

Two passages are close to stating our thesis outright.

**Mandelkern & Linzen, line 124:**

> "Of course, there are many things that LMs can't do. They may be totally incompetent with respect to the substantive facts about a given domain. But that doesn't obviously stop them from referring, any more than Luke's erroneous beliefs about Peano stops his use of 'Peano' from referring to Peano."

Reference succeeds; substantive competence about the domain fails; the two come apart. That is our thesis, conceded in advance by reference externalists, and it is the single best epigraph-quality quotation found in this pass.

**Mandelkern & Linzen, line 106**, distinguishing what is hard from what is easy for LMs:

> "What seems potentially hard for LMs is 'word-to-world' connections, since LMs are in some clear sense isolated from the external world. By contrast, 'word-to-word' connections, and in particular inferences, should in principle be possible for a language model to acquire, since connections between words just are its stock in trade."

Their word-to-world / word-to-word split is a two-route version of our profile. We should say so, and say what seven routes buy that two don't: the prediction of *which* intervention repairs *which* deficit.

## The Izzy case is a ready-made foil for §7

Their closing thought experiment (lines 130--132): Izzy is isolated at birth in a sensory-deprivation chamber, interacting with the world only through a text screen. He becomes a competent user. Their verdict: externalism dissolves the puzzle, Izzy's words refer.

Grant it. Then ask the question they don't: **Izzy cannot check anything.** He has testimony and coherence and no perception, measurement, intervention, or practical correction. Izzy's profile *is* the text-only LLM profile, constructed by philosophers who intended him as an argument for reference and who thereby built the cleanest possible illustration of our point. If Izzy's screen starts feeding him a consistent falsehood, nothing in his situation can correct it, and his words go on referring throughout.

This is the most economical way to make the paper's central distinction vivid to a *Synthese* reader, using a case they already accept. Recommend building a short §7 passage around it.

## Drafting consequences

1. Cite the cluster (Grindrod, Mandelkern & Linzen, Pepp) once, together, at the point where the paper concedes reference, rather than arguing the concession from scratch.
2. Use line 124 as the hinge quotation for "reference without answerability."
3. Build the Izzy passage in §7.
4. Keep the concession clean: none of these three claims LLMs are reliable about the world. Do not imply they do.

## Bibliographic notes

- `mandelkern_linzen_2024` — **no central bib entry.** Note the venue is *Computational Linguistics* (MIT Press), a journal, not an ACL proceedings paper, despite the local filename saying `acl` and the ACL Anthology mirror at aclanthology.org/2024.cl-3.12/. Cite as the journal article: vol. 50, no. 3, pp. 1191--1200. Getting this wrong would look careless to exactly the referees we want.
- `pepp_2025_reference_without_intentions_llms` — exists in the central bib (*Inquiry*). Verify whether the entry carries the online-first date (2025) and DOI; there is no volume/issue yet.
- Grindrod's central entry is correct.

## Leads

- **Lederman & Mahowald (2024)**, bibliotechnism, now cited by both Grindrod and Mandelkern & Linzen (the latter at line 128: LLMs are *not* in our speech community, but their words refer because they are "causally sensitive to the intelligibility of their data"). Third independent route to inherited reference. Not on disk; worth acquiring.
- **Ostertag (2024)** and **Titus (2024)** are cited (line 15) as the skeptical side. If the paper wants a named opponent for the strong no-reference view, these are the current ones.
- **Cappelen & Dever (2021)** argue standard externalism fails for LLMs on "crippling anthropocentric biases" grounds (line 48) -- the dissenting voice within the externalist camp.
- **Coenen et al. (2019)** on BERT sense-clustering in vector space (line 118), used for intention-free disambiguation. Possible empirical support for the coherence stabilizer.
