~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.group
margins group, pwcompare(pv)
<</dd_do>>
~~~~
