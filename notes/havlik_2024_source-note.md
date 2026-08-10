# Havlík 2024 Source Note

Source: Vladimír Havlík, "Meaning and understanding in large language models," *Synthese* **205(1), article 9 (2024)**. DOI: 10.1007/s11229-024-04878-4. Institute of Philosophy of the Czech Academy of Sciences / University of West Bohemia.

Metadata verified against Crossref 2026-08-08: issued and published online 2024-12-23, volume 205, issue 1, article-number 9. **Cite it as Havlík 2024, not 2025**, and note that the "9" some sources show after the volume is the article number, not an issue number. Search snippets rendered this as "205:9 (2025)"; the publisher record does not.

⚠ **Citation caution.** The local file is the **arXiv preprint** (`literature/havlik_2023_meaning_understanding_llms_arxiv2310.17407.md`, arXiv:2310.17407), not the published version of record. Everything below is read from the preprint. **Before citing any page number or direct quotation, check the Springer version**, since the preprint predates peer review and the section numbering and wording may have moved. Cite the *Synthese* DOI, not the arXiv id.

Read 2026-08-08 for the Synthese retarget literature pass.

## Why this one matters

It is the sharpest rival to our framing that the target venue has published, and it attacks a premise that our paper currently treats as uncontroversial. §3.3 is titled **"The myth of referential grounding."**

## Havlík's argument

He wants to attribute genuine (not simulated) natural-language understanding to LLMs. Three assumptions carry it (Conclusion, line 224): distinguish understanding from awareness of understanding; reject the syntax/semantics gap; and ground meaning in a way that doesn't need the world.

That third step is **semantic fragmentism** (§3.7). The minimal unit of meaning is neither the word (atomism) nor the sentence (molecularism) but a **corpus**, a "semantically saturated" fragment of language. A corpus is minimal when further additions don't change the grounding of its parts (line 195).

The payoff is stated flatly: "The meanings of linguistic expressions are grounded neither in the world, nor in an internal idea of the world, but in the linguistic corpus as a whole" (line 199). And: "If an expression is to represent something, then it represents its place in the complexity of relations to all other expressions" (line 199).

His case against referential grounding runs through Rapaport (symbol grounding "does not necessarily get us out of the circle of words - at best, it widens the circle," line 140), the instability of categorical representations under Harnad's own account ("Grounding in the ungroundedly changing relative to the grounded is thus illusory," line 144), and Popper on the impossibility of constituting universals from immediate experience (line 147). He names Coelho Mollo and Millière directly: their call for grounding is "a redundant and unfeasible myth" (line 130).

## Why this is a gift rather than a threat

The instinct is to treat him as an opponent. He isn't, and saying so is the stronger move.

**Havlík's position is the pure limiting case of the profile our paper describes.** He is arguing, in print and at our target venue, that a system participating in *coherence alone* -- relations among expressions, no perception, no measurement, no intervention, no world-directed correction -- has everything meaning requires. That is precisely the profile §7 attributes to text-only LLMs, offered by its most committed defender.

So the paper does not have to refute him on meaning. It can grant it, exactly as it already grants Coelho Mollo and Millière on reference, and then ask his account the question it doesn't answer: **what corrects a semantically saturated corpus that has drifted?** On Havlík's own terms nothing can, because correction would have to come from outside the corpus, and the corpus is where grounding lives. His third objection-and-reply (line 210) concedes the shape of this: he answers the fragility worry by observing that language "dynamically changes all the time" and that "language models are sensitive to the data on which they learn, and errors in the data significantly affect their functionality." That last clause is our failure signature, conceded.

**Russell's objection to the coherence theory is already in our draft and lands here directly.** Per `DECISIONS.md` 2026-06-12, the paper uses Russell as pedigree for the coherence-alone point: incompatible coherent systems. Semantic fragmentism has exactly the structure that objection targets, and Havlík supplies no answer to it. A "minimal semantically saturated corpus" of a well-developed falsehood satisfies his conditions. This is the single strongest place in the paper to convert an existing move into a live engagement with a current *Synthese* article.

**The concession we should make.** Havlík is right that naive referential grounding is in trouble, and Rapaport's widening-circle point is good. Our profile view doesn't need naive referential grounding, and we should say so: our stabilizers are routes of *constraint and correction*, not acts of baptism. Conceding his negative argument costs us nothing and buys the Rapaport-style objection as an ally against single-stabiliser correspondence views.

## Concrete drafting consequences

1. **§7 gains a named contemporary opponent-turned-ally.** Where the draft currently argues against a generic coherence position, name Havlík. He is 2024, in *Synthese*, and explicit.
2. **The Russell passage should point forward to him.** One sentence.
3. **Concede the anti-referentialist negative argument early** (§3 or §4) so the profile view isn't read as another referential-grounding proposal. This also pre-empts the desk reaction "hasn't Havlík shown this whole framing is confused?"
4. **Do not overstate.** He is arguing about *meaning and understanding*, not truth-tracking. Our reply must not pretend he claims LLMs are reliable about the world; he doesn't discuss reliability. The honest framing is that his account has no room for an answerability constraint, not that he denies one is needed.

## Bibliographic note

⚠ **The central bib has this paper as an arXiv preprint**, key `havlik_2023_meaning_understanding_llms` (`@misc`, eprint 2310.17407). Citing a preprint of a *Synthese* paper in a *Synthese* submission is exactly the wrong signal.

A corrected `@article` entry is now in `references-local.bib` under the distinct key `havlik_2024_meaning_understanding_llms_synthese` (distinct so the two don't collide as duplicate biber keys, since the preamble loads both bibs). **At polish time this needs collapsing**: run `python3 .house-style/push_bib.py --update havlik_2023_meaning_understanding_llms` and drop the local key. A plain `/push-bib` will match on normalized title and refuse, which is the script working as designed, not a failure.

## Leads

- **Søgaard (2022)** on unconscious language understanding and the pointing game; Havlík leans on him at lines 21--36. Relevant to our perception stabilizer.
- **Rapaport (1995)** on the widening circle -- the strongest short statement of the anti-grounding point.
- **Murzi & Steinberger (2017)** on inferentialism's own worry that the language game "threatens to fail to 'latch onto the world'" (line 162). That phrase is close to our *answerability* and is worth a look.
- **Bowman (2023)** on the uninterpretability of LLM behaviour (line 218).
