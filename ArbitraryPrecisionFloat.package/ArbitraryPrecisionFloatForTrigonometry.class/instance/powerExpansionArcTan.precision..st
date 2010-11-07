private
powerExpansionArcTan: x precision: precBits
	"Evaluate the arc tangent of x by power series expansion."
	
	| count one sum term two x2 |
	x isZero ifTrue: [^x].
	one := x one.
	two := one timesTwoPower: 1.
	count := one.
	sum := x copy.
	term := x copy.
	x2 := x squared.
	
	[term inPlaceMultiplyBy: x2.
	term inPlaceNegated.
	count inPlaceAdd: two.
	sum inPlaceAdd: term / count.
	term exponent + precBits < sum exponent] whileFalse.
	^sum