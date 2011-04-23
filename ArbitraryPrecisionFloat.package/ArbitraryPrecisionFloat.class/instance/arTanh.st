mathematical functions
arTanh
	"Evaluate the area hyperbolic cosine of the receiver."

	| argTanh x one |
	self isZero ifTrue: [^self].
	self exponent negated > nBits ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: 12 + nBits + (0 max: self exponent negated).
	x inPlaceAbs.
	one := x one.
	x >= one ifTrue: [DomainError signal: 'cannot evaluate argTanh of number of magnitude >= 1'].
	argTanh := ((one + x) / (one - x)) ln.
	argTanh inPlaceTimesTwoPower: -1.
	self negative ifTrue: [argTanh inPlaceNegated].
	^argTanh asArbitraryPrecisionFloatNumBits: nBits