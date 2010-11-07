private
powerExpansionSin: x precision: precBits
	"Evaluate the sine of x by power series expansion."
	
	| count one sum term two x2 |
	x isZero ifTrue: [^x].
	one := x one.
	two := one timesTwoPower: 1.
	count := two copy.
	sum := x copy.
	term := x copy.
	x2 := x squared.
	
	[term inPlaceMultiplyBy: x2.
	term inPlaceDivideBy: count * (count + one).
	term inPlaceNegated.
	count inPlaceAdd: two.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	^sum