private
powerExpansionCos: x
	"Evaluate the cosine of x by power series expansion."
	
	| count expo one sum term two x2 |
	x isZero ifTrue: [^x one].
	one := x one.
	two := one + one.
	count := one copy.
	sum := one copy.
	term := one copy.
	x2 := x squared.
	
	[term inPlaceMultiplyBy: x2.
	term inPlaceDivideBy: count * (count + one).
	term inPlaceNegated.
	count inPlaceAdd: two.
	sum inPlaceAdd: term.
	expo := term exponent.
	expo + nBits + 6 < sum exponent] whileFalse.
	^sum
	