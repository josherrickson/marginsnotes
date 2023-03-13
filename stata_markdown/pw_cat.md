~~~~
<<dd_do: quiet>>
webuse margex
rename group class
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.class
margins class, pwcompare(pv)
<</dd_do>>
~~~~
