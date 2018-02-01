default: stata fixRmd Rmarkdown

stata:
	/Applications/Stata/StataSE.app/Contents/MacOS/stata-se -b do build-stata.do

fixRmd:
	R -q -f fixRmd.R
	find . -type f -name '0*.Rmd' | xargs sed -i '' 's|href="|target="_blank" href="|g'

Rmarkdown:
	Rscript -e "rmarkdown::render('index.Rmd')"

clean:
	@git clean -xdf

fresh: clean default

open:
	@open index.html
