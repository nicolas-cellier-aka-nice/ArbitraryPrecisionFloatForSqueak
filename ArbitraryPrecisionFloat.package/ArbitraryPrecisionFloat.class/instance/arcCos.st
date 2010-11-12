mathematical functions
arcCos
	"Evaluate the arc cosine of the receiver."

	| arcCos x |
	self isZero ifTrue: [^(self pi timesTwoPower: -1)].
	x := self asArbitraryPrecisionFloatNumBits: 5 + nBits.
	x inPlaceAbs.
	x > 1 ifTrue: [self error: 'cannot compute arcCos of a number greater than 1'].
	arcCos := x = 1
		ifTrue: [self zero]
		ifFalse: [((x one - x squared) sqrt / x) arcTan].
	self negative ifTrue: [arcCos := x pi - arcCos].
	^arcCos asArbitraryPrecisionFloatNumBits: nBits