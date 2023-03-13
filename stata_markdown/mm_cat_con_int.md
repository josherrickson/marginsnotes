~~~~
<<dd_do: quiet>>
webuse margex
rename group class
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.sex##c.age
margins, at(age = (30 40))
margins sex, at(age = (30 40))
<</dd_do>>
~~~~
