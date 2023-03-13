~~~~
<<dd_do: quiet>>
webuse margex
rename group class
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.class##c.age
margins class, dydx(age) pwcompare(pv)
<</dd_do>>
~~~~
