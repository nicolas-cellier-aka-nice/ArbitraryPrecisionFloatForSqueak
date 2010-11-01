private
sincos
	"Evaluate the sine and cosine of the receiver"

	| halfPi quarterPi x sin sinneg cos cosneg |
	x := self moduloNegPiToPi.
	sinneg := x negative.
	x inPlaceAbs.
	halfPi := pi timesTwoPower: -1.
	(cosneg := x) > halfPi ifTrue: [x inPlaceSubtract: pi; inPlaceNegated].
	quarterPi := halfPi timesTwoPower: -1.
	x > quarterPi
		ifTrue:
			[x inPlaceSubtract: halfPi; inPlaceNegated.
			sin := self cos: x.
			cos := self sin: x]
		ifFalse:
			[sin := self sin: x.
			cos := self cos: x].
	sinneg ifTrue: [sin inPlaceNegated].
	cosneg ifTrue: [cos inPlaceNegated].
	^Array
		with: (sin asArbitraryPrecisionFloatNumBits: nBits)
		with: (cos asArbitraryPrecisionFloatNumBits: nBits)