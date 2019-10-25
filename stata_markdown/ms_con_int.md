~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.sex##c.age
margins sex, dydx(age)
<</dd_do>>
~~~~
