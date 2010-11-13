private
tan
	"Evaluate the tangent of the receiver"

	| halfPi quarterPi x sincos sinneg cosneg |
	nBits := nBits + 6.
	x := self moduloNegPiToPi.
	sinneg := x negative.
	x inPlaceAbs.
	halfPi := pi timesTwoPower: -1.
	(cosneg := x > halfPi) ifTrue: [x inPlaceSubtract: pi; inPlaceNegated].
	quarterPi := halfPi timesTwoPower: -1.
	x > quarterPi
		ifTrue:
			[x inPlaceSubtract: halfPi; inPlaceNegated.
			sincos := (self sincos: x) reversed]
		ifFalse:
			[sincos := self sincos: x].
	nBits := nBits - 6.
	sinneg ifTrue: [sincos first inPlaceNegated].
	cosneg ifTrue: [sincos last inPlaceNegated].
	sincos first inPlaceDivideBy: sincos last.
	^sincos first asArbitraryPrecisionFloatNumBits: nBits