~~~~
<<dd_do: quiet>>
webuse margex
rename group class
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.sex##i.class
margins sex#class
<</dd_do>>
~~~~
