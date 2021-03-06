md=$(shell find stata_markdown -name "*.md")
Stata_Rmd=$(md:.md=.Rmd)
R_Rmd=$(shell find R_markdown -name "*.Rmd")
Discuss_Rmd=$(shell find discussion_markdown -name "*.Rmd")

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

index.html: index.Rmd $(Stata_Rmd) $(R_Rmd) $(Discuss_Rmd)
	@echo "$< -> $@"
#	Get a list of Rmd files; we'll be temporarily copying them to the main directory
	@$(eval TMPPATH := $(shell find stata_markdown -name "*.Rmd"))
	@$(eval TMP := $(shell find stata_markdown -name "*.Rmd" | sed 's.stata_markdown/..'))
	@cp $(TMPPATH) .
	@Rscript -e "rmarkdown::render('$<')"
#	Remove any files copies up
	@rm -f $(TMP)

.PHONY: default
default: $(Stata_Rmd)  index.html

.PHONY: clean
clean:
	@git clean -xdf

.PHONY: fresh
fresh: clean default

.PHONY: open
open:
	@open index.html
