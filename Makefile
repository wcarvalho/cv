# Makefile to build PDF and Markdown cv from YAML.

# Wilka Carvalho <http://wcarvalho.github.io> and
# Brandon Amos <http://bamos.github.io> and
# Ellis Michael <http://ellismichael.com>

WEBSITE_DIR=$(HOME)/git/wcarvalho.github.io
WEBSITE_PDF=$(WEBSITE_DIR)/files/wilka_carvalho_CV.pdf
WEBSITE_MD=$(WEBSITE_DIR)/_includes/cv.md
WEBSITE_DATE=$(WEBSITE_DIR)/_includes/last-updated.txt

TEMPLATES=$(shell find templates -type f)

BUILD_DIR=build
TEX=$(BUILD_DIR)/cv.tex
PDF=$(BUILD_DIR)/cv.pdf
MD=$(BUILD_DIR)/cv.md

# ifneq ("$(wildcard cv.hidden.yaml)","")
YAML_FILES=yaml/*.yaml
# else
	# YAML_FILES = cv_academic.yaml
# endif

.PHONY: all public viewpdf stage jekyll push clean

all: $(PDF) $(MD)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)


$(TEX) $(MD): $(TEMPLATES) $(YAML_FILES) generate.py
	ipython generate.py -- $(YAML_FILES) cv_academic.yaml

$(PDF): $(TEX)
	# TODO: Hack for biber on OSX.
	# rm -rf /var/folders/zt/2qb2nh5x04d3x7qxgpgvlkk40000gn/T/par-77696c6b61/cache-ec7adafccc6b3891989ad6eb09778d44c1fecb97
	cp templates/latex/res.cls $(BUILD_DIR)
	cd $(BUILD_DIR) && latexmk -pdf cv


viewpdf: $(PDF)
	open $(PDF)

stage: $(PDF) $(MD)
	cp $(PDF) $(WEBSITE_PDF)
	cp $(MD) $(WEBSITE_MD)
	date +%Y-%m-%d > $(WEBSITE_DATE)

jekyll: stage
	cd $(WEBSITE_DIR) && bundle exec jekyll server

push: stage
	git -C $(WEBSITE_DIR) add $(WEBSITE_PDF) $(WEBSITE_MD) $(WEBSITE_DATE)
	git -C $(WEBSITE_DIR) commit -m "Update cv."
	git -C $(WEBSITE_DIR) push

clean:
	rm -rf $(BUILD_DIR)/cv*
