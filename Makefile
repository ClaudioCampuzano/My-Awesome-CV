.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
CUSTOM= custom-cv
RESUME_DIR = examples/resume
CV_DIR = examples/cv
CUSTOM_DIR= $(CUSTOM)/cv

RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
CUSTOM_SRCS = $(shell find $(CUSTOM_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(CUSTOM)/*.pdf 

actual: $(CUSTOM)/cv_claudio_campuzano.tex $(CUSTOM_SRCS)
	$(CC) -output-directory=$(CUSTOM) $< 
