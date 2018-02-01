# Combining Stata's Dyndoc and R's RMarkdown

Stata's [dyndoc](https://www.stata.com/manuals/pdyndoc.pdf) is a terrific start towards an RMarkdown-like support, but it does not yet include many advance formatting features (and only compiles to HTML).

This repository demostrates how to use a dyndoc file inside a larger RMarkdown document. If you want to see this in practice, take a look at either of my Stata workshop notes ([1](https://github.com/josherrickson/stata1) or [2](https://github.com/josherrickson/stata2)).


Files:

- "index.Rmd" - This file contains all the RMarkdown front-matter, some introductory text, and calls to include all other files.
- "stata_markdown/*.md" - Any Stata markdown files in here will be processed by Stata and the corresponding Rmd file built in the main directory.
- "build_stata.do" - A simple Stata Do-file that executes `dyndoc` on each Stata Markdown file.
- "fixRmd.R" - The results of a call to `dyndoc` are an HTML file. Markdown can of course process pure HTML, but there are a few modifications needed before the file can be processed correction by RMarkdown.
- "Makefile" - The Makefile to build this.
    - `make stata` - Runs the "build_stata.do" file to compile the Stata Markdown into Rmd files.
    - `make fixRmd` - Runs the "fixRmd.R" script on all Stata compiled Rmd files.
    - `make Rmarkdown` - Compile the Rmd files.
    - `make` - Runs all three of the above commands in the appropriate order.
    - `make clean` - Removes any temporary and output files.
    - `make fresh` - Equivalent to `make clean; make`.
