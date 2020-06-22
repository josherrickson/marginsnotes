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

Odds in each group:

~~~~
<<dd_do>>
lincom _b[_cons], or
lincom _b[_cons] + _b[2.group], or
lincom _b[_cons] + _b[3.group], or
<</dd_do>>
~~~~

Odds ratios for 2 versus 3

~~~~
<<dd_do>>
lincom _b[3.] - _b[2.group], or
logit yc ib2.group, nolog or
<</dd_do>>
~~~~

The references to each line (e.g. `_b[2.group]`) was obtained by calling `logit, coeflegend` after the original `logit` caqll.
