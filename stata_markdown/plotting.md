~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.sex##c.age
margins sex, at(age = (20(10)60))
marginsplot, recastci(rarea)
<</dd_do>>
~~~~

~~~~
<<dd_do: quiet>>
graph export "marginsplot.svg", replace
<</dd_do>>
~~~~

![](marginsplot.svg)
