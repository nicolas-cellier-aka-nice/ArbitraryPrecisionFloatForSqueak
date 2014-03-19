mathematical functions
arTanh
	"Evaluate the area hyperbolic tangent of the receiver."

	| arTanh x one |
	self isZero ifTrue: [^self].
	self exponent negated > nBits ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: 12 + nBits + (0 max: self exponent negated).
	x inPlaceAbs.
	one := x one.
	x >= one ifTrue: [DomainError signal: 'cannot evaluate arTanh of number of magnitude >= 1'].
	arTanh := ((one + x) / (one - x)) ln.
	arTanh inPlaceTimesTwoPower: -1.
	self negative ifTrue: [arTanh inPlaceNegated].
	^arTanh asArbitraryPrecisionFloatNumBits: nBits