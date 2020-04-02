~~~~
<<dd_do: quiet>>
webuse margex
<</dd_do>>
~~~~

~~~~
<<dd_do>>
regress y i.group##i.sex
margins sex@group, contrast(pv nowald)
margins group, dydx(sex) pwcompare(pv)
<</dd_do>>
~~~~
Note that this works because `sex` is binary, thus it's coefficient (obtained via `dydx`) is for a 1-unit change, from 0 to 1. If you had a more complicated situation (e.g. there was a third gender category but you only wanted to compare male versus female), you could instead manually define your contrast.

~~~~
<<dd_do>>
margins {sex +1 -1}#{group +1 -1 0}, contrast(pv nowald)
margins {sex +1 -1}#{group +1 -1 0} {sex +1 -1}#{group +1 0 -1} {sex +1 -1}#{group 0 +1 -1}, contrast(pv nowald)
<</dd_do>>
~~~~

Here the `{variable # # #}` notation defines a contrast - the values correspond to a linear equation for the levels. E.g. if we wanted to test `male = female`, or `male - female = 0`, we could write this as `(+1)male + (-1)female = 0`, therefore the contrast is `+1 -1` (in `sex`, male is the lowest level, female is the higher level). For group, we want to compare each pair of groups, so `group1 = group2` is equivalent to `(+1)group1 + (-1)group2 + (0)group3 = 0`, whose contrast is `+1 -1 0`.

If you wanted a diff-in-diff-in-diff estimate (e.g. say you've got males and females, and some undergo each of treatment 0 and treatment 1, and you want to test whether the difference in pre-post changes amongst men is significantly different than the difference in pre-post changes amongst women), you can run something like `margins sex#treatment, dydx(prepost) contrast(pv nowald)`.
