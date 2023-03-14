md=$(shell find stata_markdown -name "*.md")
Stata_Rmd=$(md:.md=.Rmd)
R_Rmd=$(shell find R_markdown -name "*.Rmd")
Discuss_Rmd=$(shell find discussion_markdown -name "*.Rmd")

stata_markdown/%.Rmd: stata_markdown/%.md
	@echo "$< -> $@"
	@/Applications/Stata/StataSE.app/Contents/MacOS/stata-se -b 'dyntext "$<", saving("$@") replace nostop'
#	Using <<dd_do: quiet>> produces empty codeblocks in output, remove them
	@perl -0777 -i -pe 's/~~~~\n~~~~//g' $@

index.html: index.Rmd $(Stata_Rmd) $(R_Rmd) $(Discuss_Rmd)
	@echo "$< -> $@"
	@Rscript -e "rmarkdown::render('$<')"

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
