~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
logit yc i.group, nolog or
<</dd_do>>
~~~~

Below, the references to each coefficient (e.g. `_b[2.group]`) was obtained by calling `logit, coeflegend` after the original `logit` call.

~~~~
<<dd_do>>
lincom _b[_cons], or
lincom _b[_cons] + _b[2.group], or
lincom _b[_cons] + _b[3.group], or
<</dd_do>>
~~~~

~~~~
<<dd_do>>
lincom _b[2.group], or
lincom _b[3.group], or
lincom _b[3.group] - _b[2.group], or
<</dd_do>>
~~~~
