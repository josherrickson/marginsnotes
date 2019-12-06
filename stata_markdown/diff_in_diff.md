~~~~
<<dd_do>>
* Set up data
webuse grunfeld, clear
gen treated = 0
replace treated=1 if company>5
replace time = 0
replace time = 1 if year>=1940


* Without log
mixed mvalue i.time##i.treated || company:

margins time#treated
mata:
r = st_matrix("r(table)")
(r[1,1] - r[1,2]) - (r[1,3] - r[1,4])
end

margins r.treated, at(time = (0 1)) contrast(nowald atcontrast(r))



* With log
gen lgm = log(mvalue)

mixed lgm i.time##i.treated || company:

margins time#treated, expression(exp(predict(xb)))
mata:
r = st_matrix("r(table)")
(r[1,1] - r[1,2]) - (r[1,3] - r[1,4])
end

margins r.treated, at(time = (0 1)) contrast(nowald atcontrast(r)) expression(exp(predict(xb)))
<</dd_do>>
~~~~
