~~~~
<<dd_do: quiet>>
webuse margex
rename group class
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.sex c.age
margins, dydx(age)
<</dd_do>>
~~~~
