mathematical functions
arCosH
	"Evaluate the area hyperbolic cosine of the receiver."

	| argCosh x one y two |
	x := self asArbitraryPrecisionFloatNumBits: 6 + nBits.
	one := x one.
	x < one ifTrue: [self error: 'cannot compute argCosh of a number less than 1'].
	x = one ifTrue: [^self zero].
	y := x - one.
	y < one
		ifTrue:
			[y := y asArbitraryPrecisionFloatNumBits: 6 + nBits + (y exponent negated).
			two := one timesTwoPower: 1.
			argCosh := ((y * (y + two)) sqrt + y + one) ln]
		ifFalse: [argCosh := ((x squared - one) sqrt + x) ln].
	^argCosh asArbitraryPrecisionFloatNumBits: nBits