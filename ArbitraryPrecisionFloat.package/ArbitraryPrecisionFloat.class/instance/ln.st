mathematical functions
ln
	"Answer the neperian logarithm of the receiver."

	| x4 one two p res s16 |
	self <= self zero ifTrue: [DomainError signal: 'ln is only defined for x > 0.0'].
	
	one := self one.
	self = one ifTrue: [^self zero].
	self < one ifTrue: [^self reciprocal ln negated].
	two := one timesTwoPower: 1.

	"Use Salamin algorithm (approximation is good if x is big enough)
		x ln = Pi  / (2 * (1 agm: 4/x) ).
	If x not big enough, compute (x timesTwoPower: p) ln - (2 ln * p)"
	s16 := self asArbitraryPrecisionFloatNumBits: nBits + 16.
	x4 := (4 asArbitraryPrecisionFloatNumBits: nBits + 16) 
				inPlaceDivideBy: s16.
	s16 exponent > (nBits + 16) 
		ifTrue: [p := 0]
		ifFalse: 
			[p := nBits + 16 - s16 exponent.
			x4 inPlaceTimesTwoPower: p negated].
	res := s16 pi / (one agm: x4) timesTwoPower: -1.
	^(self = two 
		ifTrue: [res / (p + 1)]
		ifFalse: [p = 0 ifTrue: [res] ifFalse: [res - ((two asArbitraryPrecisionFloatNumBits: nBits + p highBit + 16) ln * p)]]) 
			asArbitraryPrecisionFloatNumBits: nBits