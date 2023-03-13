~~~~
<<dd_do: quiet>>
webuse margex
rename group class
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.class##i.sex
margins class#sex, pwcompare(pv)
<</dd_do>>
~~~~


This produces a lot of comparisons; if we only cared about the comparisons one
way (e.g. gender differences within each class), we can restrict our output to
these results.

~~~~
<<dd_do>>
margins sex@class, contrast(pv nowald)
<</dd_do>>
~~~~

Note that the results are identical, it's just a nicer output.

The `pv` option requests p-values instead of confidence intervals; the `nowald`
option suppresses an omnibus test of any difference between classes (e.g. ANOVA
output).
