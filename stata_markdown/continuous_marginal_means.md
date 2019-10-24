~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.sex c.age c.distance
margins, at(age = (30 40))
margins, at(age = (30 40) distance = (10 100))
margins sex, at(age = (30 40))
<</dd_do>>
~~~~
