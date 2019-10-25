~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.group##i.sex
margins group#sex, pwcompare(pv)
<</dd_do>>
~~~~


This produces a lot of comparisons; if we only cared about the comparisons one way (e.g. gender differences within each group), we can restrict our
output to these results.

~~~~
<<dd_do>>
margins sex@group, contrast(pv nowald)
<</dd_do>>
~~~~

Note that the results are identical, it's just a nicer output.

The `pv` option requests p-values instead of confidence intervals; the `nowald` option suppresses an omnibus test of any difference between groups
(e.g. ANOVA output).
