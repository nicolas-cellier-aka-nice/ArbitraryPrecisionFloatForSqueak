private
powerExpansionSinCos: x precision: precBits
	"Evaluate the sine and cosine of x by power series expansion."
	
	| count one sin cos term |
	one := x one.
	count := one copy.
	cos := one copy.
	sin := x copy.
	term := x copy.
	
	[count inPlaceAdd: one.
	term
		inPlaceMultiplyBy: x;
		inPlaceDivideBy: count;
		inPlaceNegated.
	cos inPlaceAdd: term.

	count inPlaceAdd: one.
	term
		inPlaceMultiplyBy: x;
		inPlaceDivideBy: count.
	sin inPlaceAdd: term.
	
	term exponent + precBits < sin exponent] whileFalse.
	^Array with: sin with: cos