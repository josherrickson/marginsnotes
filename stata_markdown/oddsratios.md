~~~~
<<dd_do: quiet>>
webuse margex
rename group class
<</dd_do>>
~~~~

~~~~
<<dd_do>>
logit yc i.class, nolog or
<</dd_do>>
~~~~

Below, the references to each coefficient (e.g. `_b[2.class]`) was obtained by
calling `logit, coeflegend` after the original `logit` call.

~~~~
<<dd_do>>
lincom _b[_cons], or
lincom _b[_cons] + _b[2.class], or
lincom _b[_cons] + _b[3.class], or
<</dd_do>>
~~~~

~~~~
<<dd_do>>
lincom _b[2.class], or
lincom _b[3.class], or
lincom _b[3.class] - _b[2.class], or
<</dd_do>>
~~~~
