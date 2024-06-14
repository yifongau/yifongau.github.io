# What to compile by default?
SOURCES := index.md 
TARGETS := $(patsubst %.md,%.html,$(SOURCES))

STYLES := style/tufte.css \
				style/pandoc.css \
				style/pandoc-solarized.css \
				style/tufte-extra.css

.PHONY: all
all: $(TARGETS)

# Note: you will need pandoc 2 or greater for this to work

## Generalized rule: how to build a .html file from each .md
%.html: %.md tufte.html5 $(STYLES)
	pandoc \
		--katex \
		--section-divs \
		--from markdown+tex_math_single_backslash \
		--filter pandoc-sidenote \
		--to html5+smart \
		--template=tufte \
		$(foreach style,$(STYLES),--css $(style)) \
		--output $@ \
		$<

.PHONY: clean
clean:
	rm $(TARGETS)

