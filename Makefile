md=$(shell find stata_markdown -name "*.md")
Stata_Rmd=$(md:.md=.Rmd)
md2=$(shell find stata_markdown -name "*.md" | sed 's.stata_markdown/..')
Stata_Ready=$(md2:.md=.Rmd)

stata_markdown/%.Rmd: stata_markdown/%.md
	@echo "$< -> $@"
	@/Applications/Stata/StataSE.app/Contents/MacOS/stata-se -b 'dyndoc "$<", saving("$@") replace nostop'
# Remove <p> at the front of sections
	@sed -E -i '' '/^\<p\>\^#/s/\<\/?p\>//g' $@
# Using <<dd_do: quiet>> produces empty codeblocks in output, remove them
	@sed -E -i '' '/\<pre\>\<code\>\<\/code\>\<\/pre\>/d' $@
# Convert ^#^ to #
	@sed -i '' 's.\^#\^.#.g' $@
# Convert ^$^ to $ and ^$$^ to $$
	@sed -i '' 's.\^$$^.$$.g' $@
	@sed -i '' 's.\^$$$$\^.$$$$.g' $@
# This line makes all links open in new windows.
	@sed -i '' 's|href="|target="_blank" href="|g' $@

index.html: index.Rmd $(Stata_Rmd)
	@echo "$< -> $@"
#	Get a list of Rmd files; we'll be temporarily copying them to the main directory
	@$(eval TMPPATH := $(shell find stata_markdown -name "*.Rmd"))
	@$(eval TMP := $(shell find stata_markdown -name "*.Rmd" | sed 's.stata_markdown/..'))
	@cp $(TMPPATH) .
# All images get copied too
	@cp stata_markdown/*.svg . 2>/dev/null || :
	@Rscript -e "rmarkdown::render('$<')"
#	Remove any files copies up
	@rm -rf $(TMP)
	@rm -rf *.svg

default: $(Stata_Rmd)  index.html

clean:
	@git clean -xdf

fresh: clean default

open:
	@open index.html
