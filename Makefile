# Minimal makefile for Sphinx documentation
#

VE ?= ./ve
REQUIREMENTS ?= requirements.txt
SYS_PYTHON ?= /usr/local/bin/python3.12
PIP ?= ve/bin/pip


# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= ve/bin/sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)


build:
	rm -rf $(VE)
	$(SYS_PYTHON) -m venv $(VE)
	$(PIP) install --upgrade pip
	$(PIP) install --requirement $(REQUIREMENTS)

clean:
	rm -rf $(VE)