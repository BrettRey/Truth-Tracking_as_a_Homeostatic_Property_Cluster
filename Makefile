# Makefile for LaTeX paper compilation
# Grounding Without Corrective Control: Truth-Tracking Profiles for Large Language Models

# Configuration
LATEX = xelatex
BIBER = biber
MAIN = truth-tracking-profiles
SUPPLEMENT = online-resource-1
ANON_MAIN = truth-tracking-profiles-anonymous
ANON_SUPPLEMENT = online-resource-1-anonymous
OUTDIR = .
PREAMBLE = .house-style/preamble.tex
BIBS = references.bib $(wildcard references-local.bib)

# Targets
.PHONY: all anonymous clean distclean view help test

# Default target: build the PDF
all: $(MAIN).pdf $(SUPPLEMENT).pdf

# Double-anonymized review copies. Author information, acknowledgements, and the
# in-manuscript AI disclosure remain in the named build but are suppressed here.
anonymous:
	@echo "==> Building anonymous review copy..."
	$(LATEX) -jobname=$(ANON_MAIN) "\def\TTPANONYMOUS{}\input{$(MAIN).tex}"
	$(BIBER) $(ANON_MAIN)
	$(LATEX) -jobname=$(ANON_MAIN) "\def\TTPANONYMOUS{}\input{$(MAIN).tex}"
	$(LATEX) -jobname=$(ANON_MAIN) "\def\TTPANONYMOUS{}\input{$(MAIN).tex}"
	$(LATEX) -jobname=$(ANON_SUPPLEMENT) "\def\TTPANONYMOUS{}\input{$(SUPPLEMENT).tex}"
	$(BIBER) $(ANON_SUPPLEMENT)
	$(LATEX) -jobname=$(ANON_SUPPLEMENT) "\def\TTPANONYMOUS{}\input{$(SUPPLEMENT).tex}"
	$(LATEX) -jobname=$(ANON_SUPPLEMENT) "\def\TTPANONYMOUS{}\input{$(SUPPLEMENT).tex}"
	@echo "==> Anonymous review copies complete"

# Full build sequence with bibliography
$(MAIN).pdf: $(MAIN).tex $(PREAMBLE) $(BIBS)
	@echo "==> First LaTeX pass..."
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex
	@echo "==> Running Biber..."
	$(BIBER) $(MAIN)
	@echo "==> Second LaTeX pass..."
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex
	@echo "==> Third LaTeX pass (finalizing)..."
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex
	@echo "==> Build complete: $(MAIN).pdf"

$(SUPPLEMENT).pdf: $(SUPPLEMENT).tex $(PREAMBLE) $(BIBS)
	@echo "==> First LaTeX pass for $(SUPPLEMENT)..."
	$(LATEX) -output-directory=$(OUTDIR) $(SUPPLEMENT).tex
	@echo "==> Running Biber for $(SUPPLEMENT)..."
	$(BIBER) $(SUPPLEMENT)
	@echo "==> Second LaTeX pass for $(SUPPLEMENT)..."
	$(LATEX) -output-directory=$(OUTDIR) $(SUPPLEMENT).tex
	@echo "==> Third LaTeX pass for $(SUPPLEMENT)..."
	$(LATEX) -output-directory=$(OUTDIR) $(SUPPLEMENT).tex
	@echo "==> Build complete: $(SUPPLEMENT).pdf"

# Quick build (single pass, no bibliography update)
quick: $(MAIN).tex $(PREAMBLE)
	@echo "==> Quick build (single pass)..."
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex

# Use LuaLaTeX instead of XeLaTeX (not recommended - breaks PDF text layer)
lualatex: LATEX = lualatex
lualatex: all

# Clean build artifacts (keep PDF)
clean:
	@echo "==> Cleaning build artifacts..."
	rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).bcf $(MAIN).blg $(MAIN).log
	rm -f $(MAIN).out $(MAIN).run.xml $(MAIN).toc $(MAIN).fdb_latexmk
	rm -f $(MAIN).fls $(MAIN).synctex.gz
	rm -f $(SUPPLEMENT).aux $(SUPPLEMENT).bbl $(SUPPLEMENT).bcf $(SUPPLEMENT).blg $(SUPPLEMENT).log
	rm -f $(SUPPLEMENT).out $(SUPPLEMENT).run.xml $(SUPPLEMENT).toc $(SUPPLEMENT).fdb_latexmk
	rm -f $(SUPPLEMENT).fls $(SUPPLEMENT).synctex.gz
	rm -f $(ANON_MAIN).aux $(ANON_MAIN).bbl $(ANON_MAIN).bcf $(ANON_MAIN).blg $(ANON_MAIN).log
	rm -f $(ANON_MAIN).out $(ANON_MAIN).run.xml $(ANON_MAIN).toc $(ANON_MAIN).synctex.gz
	rm -f $(ANON_SUPPLEMENT).aux $(ANON_SUPPLEMENT).bbl $(ANON_SUPPLEMENT).bcf $(ANON_SUPPLEMENT).blg $(ANON_SUPPLEMENT).log
	rm -f $(ANON_SUPPLEMENT).out $(ANON_SUPPLEMENT).run.xml $(ANON_SUPPLEMENT).toc $(ANON_SUPPLEMENT).synctex.gz
	@echo "==> Clean complete"

# Clean everything including PDF
distclean: clean
	@echo "==> Removing PDF..."
	rm -f $(MAIN).pdf $(SUPPLEMENT).pdf $(ANON_MAIN).pdf $(ANON_SUPPLEMENT).pdf
	@echo "==> Deep clean complete"

# Open PDF viewer (macOS)
view: $(MAIN).pdf
	@echo "==> Opening PDF..."
	open $(MAIN).pdf

# Test the Python specification
test:
	@echo "==> Testing theoretical specification..."
	cd src && python typology.py

# Show available targets
help:
	@echo "Available targets:"
	@echo "  make          - Build PDF with full bibliography (default)"
	@echo "                  and Online Resource 1"
	@echo "  make anonymous - Build double-anonymized review copies"
	@echo "  make quick    - Quick build (single pass, no bib update)"
	@echo "  make lualatex - Build using LuaLaTeX (not recommended)"
	@echo "  make clean    - Remove build artifacts (keep PDF)"
	@echo "  make distclean- Remove everything including PDF"
	@echo "  make view     - Open PDF (macOS only)"
	@echo "  make test     - Run Python specification tests"
	@echo "  make help     - Show this help message"
