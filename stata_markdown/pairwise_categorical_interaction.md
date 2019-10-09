~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.group##i.sex
margins group#sex, pwcompare(pv)
margins sex@group, contrast(pv nowald)
<</dd_do>>
~~~~
