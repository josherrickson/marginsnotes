md=$(shell find stata_markdown -name "*.md")
Stata_Rmd=$(md:.md=.Rmd)
md2=$(shell find stata_markdown -name "*.md" | sed 's.stata_markdown/..')
Stata_Ready=$(md2:.md=.Rmd)

stata_markdown/%.Rmd: stata_markdown/%.md
	echo "$< -> $@"
	/Applications/Stata/StataSE.app/Contents/MacOS/stata-se -b 'dyndoc "$<", saving("$@") replace nostop'
	Rscript --vanilla fixRmd.R $@
	find . -type f -name '*.Rmd' | xargs sed -i '' 's|href="|target="_blank" href="|g'

index.html: index.Rmd $(Stata_Rmd)
	echo "$< -> $@"
	cp stata_markdown/*.Rmd .
	cp stata_markdown/*.svg .
	Rscript -e "rmarkdown::render('$<')"
	find . -name '*.Rmd' -maxdepth 1 | grep -v "index" | xargs rm
	rm -rf *.svg

default: $(Stata_Rmd)  index.Rmd

clean:
	@git clean -xdf

fresh: clean default

open:
	@open index.html
