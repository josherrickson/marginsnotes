~~~~
<<dd_do: quiet>>
webuse margex
rename group class
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.class##c.age
margins class, at(age = (20 60))
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

Due to this being a linear model as well as `age` entering linearly (as opposed
to say quadratically), two points are sufficient to fit a line. If you fit a
non-linear model (such as logistic regression) or allowed `age` to enter
non-linearlly, you may want to add more points to the plot. There is a trade-off
between speed (more points take longer to estimate) and smoothness of the
resulting curve.

~~~~
<<dd_do>>
regress y i.class##c.age##c.age
margins class, at(age = (20(5)60))
marginsplot, recastci(rarea)  ciopts(fcolor(%25) lcolor(%25)) recast(line)
<</dd_do>>
~~~~

`recast(line)` removes the points to make the plot a bit cleaner.

~~~~
<<dd_do: quiet>>
graph export "marginsplot2.svg", replace
<</dd_do>>
~~~~

![](marginsplot2.svg)
