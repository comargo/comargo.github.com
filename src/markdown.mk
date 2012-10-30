outfiles = $(addprefix ../,$(SOURCES:%.md=%.html))

PANDOC ?= /usr/bin/pandoc
PANDOC_OPTS ?= --toc \
			   --smart \
			   --normalize \
			   --include-in-header=meta.html \
			   --include-before-body=header.html \
			   --include-after-body=footer.html \
			   --html5
#			   --highlight-style=cpp 


all: htmls

clean:
	rm $(outfiles)

htmls: $(outfiles)

Makefile: markdown.mk
	touch $@

$(outfiles): Makefile meta.html header.html footer.html

../%.html: %.md
	$(PANDOC) $(PANDOC_OPTS) -s -o $@ $<

.PHONY : clean htmls all
