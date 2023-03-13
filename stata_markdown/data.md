The [`webuse`](https://www.stata.com/manuals/dwebuse.pdf) command can load the directly.

~~~~
<<dd_do>>
webuse margex
<</dd_do>>
~~~~

The `marginaleffects` package in R doesn't like a variable being named "group",
so we rename it.

~~~~
<<dd_do>>
rename group class
summarize, sep(0)
<</dd_do>>
~~~~
