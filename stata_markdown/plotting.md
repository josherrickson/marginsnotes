~~~~
<<dd_do: quiet>>
webuse margex
rename group class
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.class##c.age
margins class, at(age = (20(10)60))
marginsplot, recastci(rarea)  ciopts(fcolor(%25) lcolor(%25))
<</dd_do>>
~~~~

The `recastci(rarea)` option plots the confidence region, rather than just
confident intervals at each estimated point (to more closely mimic R's output).
The `ciopts()` allows you to pass options for the confidence intervals; these
particular options just make the confidence region (and it's outline)
transparent.

~~~~
<<dd_do: quiet>>
graph export "marginsplot.svg", replace
<</dd_do>>
~~~~

![](marginsplot.svg)
