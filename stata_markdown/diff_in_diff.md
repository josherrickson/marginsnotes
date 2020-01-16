~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.group##i.sex
margins sex@group, contrast(pv nowald)
margins group, dydx(sex) pwcompare(pv)
<</dd_do>>
~~~~
