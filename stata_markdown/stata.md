^#^ Including a Stata Chunk

This document is a Stata markdown file. There are a few customizations to Markdown that need to be made to ease the move to Rmarkdown. Basically when
this file is build, Stata will convert it straight to HTML. To avoid some aspects of it being converted to HTML, we'll modify existing tags (by
surrounding them with `^`), then use a script to fix it up.

- Sections. For section headers, instead of `^#^`, `^#^^#^`, etc, we use `\^\#\^`, `\^\#\#\^`.
- Equations. For inline equations (`\$`) or full-line equations (`\$\$`), instead use `\^\$\^` and `\^​\$\$\^`.

We can include Stata code easily

~~~~
<<dd_do>>
sysuse auto
<</dd_do>>
~~~~

Plots require one extra line.

~~~~
<<dd_do>>
twoway scatter mpg trunk
<</dd_do>>
~~~~

<<dd_graph: replace>>
