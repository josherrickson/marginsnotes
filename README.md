# Combining Stata's Dyndoc and R's RMarkdown

Stata's [dyndoc](https://www.stata.com/manuals/pdyndoc.pdf) is a terrific start towards an RMarkdown-like support, but it does not yet include many
advance formatting features (and only compiles to HTML).

This repository demostrates how to use a dyndoc file inside a larger RMarkdown document. If you want to see this in practice, take a look at either of
my Stata workshop notes ([1](https://github.com/josherrickson/stata1) or [2](https://github.com/josherrickson/stata2)).

Create any Rmarkdown files that you want in the main directory. Create any Stata markdown files (with extension .md) that you want inside the
"stata_markdown" folder. There are a few modifications to Markdown tags:

- Sections. For section headers, instead of `#`, `##`, etc, we use `^#^`, `^##^`.
- Equations. For inline equations (`$`) or full-line equations (`$$`), instead use `^$^` and `^$$^`.

Don't forget to include subfiles inside index.Rmd:


    `​``{r child = "file.Rmd"}
    ```



Files:

- "index.Rmd" - This file contains all the RMarkdown front-matter, some introductory text, and calls to include all other files.
- "stata_markdown/*.md" - Any Stata markdown files in here will be processed by Stata and the corresponding Rmd file built in the main directory.
- "Makefile" - The Makefile to build this.
    - `make` - Compiles all Stata dyndoc files, makes the necessary clean-ups, and then builds the complete
    - `make clean` - Removes any temporary and output files.
    - `make stata_markdown/___.Rmd` - Will compile a specific .md file into a .Rmd file with all cleaning. Useful for debugging. Called if needed during `make`.
    - `make index.html` - Compiles just the index.Rmd into an html. Useful for debugging. Called if needed during `make`.
