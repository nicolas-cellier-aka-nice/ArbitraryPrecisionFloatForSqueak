*ArbitraryPrecisionFloat
asArbitraryPrecisionFloatNumBits: n 
	"Answer a Floating point with arbitrary precision
	close to the receiver."

	"Note: form below would not be the closest approximation
	^ (numerator asArbitraryPrecisionFloatNumBits: n)
		inPlaceDivideBy: (denominator asArbitraryPrecisionFloatNumBits: n)"

	| a b q r exponent nBits ha hb hq q1 |
	a := numerator abs.
	b := denominator abs.
	ha := a highBit.
	hb := b highBit.

	"If both numerator and denominator are represented exactly in floating point number,
	then fastest thing to do is to use hardwired float division"
	nBits := n + 1.
	(ha < nBits and: [hb < nBits]) 
		ifTrue: 
			[^(numerator asArbitraryPrecisionFloatNumBits: n) 
				inPlaceDivideBy: (denominator asArbitraryPrecisionFloatNumBits: n)].

	"Try and obtain a mantissa with n+1 bits by integer division.
	This is n bits for mantissa plus 1 bit for rounding
	First guess is rough, we might get one more bit or one less"
	exponent := ha - hb - nBits.
	exponent > 0 
		ifTrue: [b := b bitShift: exponent]
		ifFalse: [a := a bitShift: exponent negated].
	q := a quo: b.
	r := a - (q * b).
	hq := q highBit.

	"Use exactly nBits"
	hq > nBits 
		ifTrue: 
			[exponent := exponent + hq - nBits.
			r := (q bitAnd: (1 bitShift: hq - nBits) - 1) * b + r.
			q := q bitShift: nBits - hq].
	hq < nBits 
		ifTrue: 
			[exponent := exponent + hq - nBits.
			q1 := (r bitShift: nBits - hq) quo: b.
			q := (q bitShift: nBits - hq) bitAnd: q1.
			r := (r bitShift: nBits - hq) - (q1 * b)].

	"check if we should round upward.
	The case of exact half (q bitAnd: 1) = 1 & (r isZero)
	will be handled by Integer>>asDouble"
	((q bitAnd: 1) isZero or: [r isZero]) ifFalse: [q := q + 1].

	"build the Double"
	^(self positive 
		ifTrue: [q asArbitraryPrecisionFloatNumBits: n]
		ifFalse: [q negated asArbitraryPrecisionFloatNumBits: n]) 
			inPlaceTimesTwoPower: exponent