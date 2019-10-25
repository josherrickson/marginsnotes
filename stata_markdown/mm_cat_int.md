~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.sex##i.group
margins sex#group
<</dd_do>>
~~~~
