~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.group##c.age
margins group, dydx(age) pwcompare(pv)
<</dd_do>>
~~~~
