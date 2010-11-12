mathematical functions
arcSin
	"Evaluate the arc sine of the receiver."

	| arcSin x |
	self isZero ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: 5 + nBits.
	x inPlaceAbs.
	x > 1 ifTrue: [self error: 'cannot compute arcSin of a number greater than 1'].
	arcSin := x = 1
		ifTrue: [self pi timesTwoPower: -1]
		ifFalse: [(x / (x one - x squared) sqrt) arcTan].
	self negative ifTrue: [arcSin inPlaceNegated].
	^arcSin asArbitraryPrecisionFloatNumBits: nBits