private
powerExpansionCos: x precision: precBits
	"Evaluate the cosine of x by power series expansion."
	
	| count one sum term two x2 |
	x isZero ifTrue: [^x one].
	one := x one.
	two := one timesTwoPower: 1.
	count := one copy.
	sum := one copy.
	term := one copy.
	x2 := x squared.
	
	[term inPlaceMultiplyBy: x2.
	term inPlaceDivideBy: count * (count + one).
	term inPlaceNegated.
	count inPlaceAdd: two.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	^sum