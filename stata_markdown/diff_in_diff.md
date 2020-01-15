~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.group##i.sex
margins sex@group, contrast(pv nowald)
margins sex#{group -1 1 0}, contrast(pv)
<</dd_do>>
~~~~
The manual contrast `{group -1 1 0}` is specifying that we want to compare groups 1 and 2, ignoring group 3. We could iterate over the three comparisons in three different `margins` calls, or below shows how to specify multiple contrasts at once.
~~~~
<<dd_do>>
margins sex#({group -1 1 0} {group -1 0 1} {group 0 -1 1}), contrast(pv)
<</dd_do>>
~~~~
