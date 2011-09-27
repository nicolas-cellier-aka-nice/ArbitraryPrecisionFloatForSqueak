mathematical functions
arSinh
	"Evaluate the area hyperbolic cosine of the receiver."

	| arSinh x one |
	self isZero ifTrue: [^self].
	self exponent negated > nBits ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: 6 + nBits + (0 max: self exponent negated).
	x inPlaceAbs.
	one := x one.
	arSinh := ((x squared + one) sqrt + x) ln.
	self negative ifTrue: [arSinh inPlaceNegated].
	^arSinh asArbitraryPrecisionFloatNumBits: nBits