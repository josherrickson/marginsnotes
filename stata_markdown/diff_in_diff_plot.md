~~~~
<<dd_do: quiet>>
webuse margex
rename group class
<</dd_do>>
~~~~

Generate a variable indicating whether age is above 40 before fitting the model.

~~~~
<<dd_do>>
generate above40 = age > 40
regress y i.above40##c.age
margins, at(age = (20 40) above40 = 0) ///
         at(age = (40 60) above40 = 1)
marginsplot, recastci(rarea) ciopts(fcolor(%25) lcolor(%25)) ///
             legend(off)
<</dd_do>>
~~~~

Note the use of two separate `at` statements to ensure that each trend is
plotted only in the appropriate `age` range. The legend is suppressed as it is
obvious in this situation.

~~~~
<<dd_do: quiet>>
graph export "its.svg", replace
<</dd_do>>
~~~~

![](its.svg)

For a full diff-in-diff plot, simply add the additional term as usual.


~~~~
<<dd_do>>
regress y i.class##i.above40##c.age
margins class, at(age = (20 40) above40 = 0) ///
               at(age = (40 60) above40 = 1)
marginsplot, recast(line) noci ///
  plot1opts(lcolor("red")) ///
  plot2opts(lcolor("blue")) ///
  plot3opts(lcolor("red") lpattern("dash")) ///
  plot4opts(lcolor("blue") lpattern("dash")) ///
  plot5opts(lcolor("red") lpattern("dash_dot")) ///
  plot6opts(lcolor("blue") lpattern("dash_dot")) ///
  legend(order(1 "Class 1" 3 "Class 2" 5 "Class 3"))
<</dd_do>>
~~~~

The plot requires a lot more configuring to make it look nice; I've even
suppressed the confidence bounds to make it more readable.

~~~~
<<dd_do: quiet>>
graph export "diffindiff.svg", replace
<</dd_do>>
~~~~

![](diffindiff.svg)
