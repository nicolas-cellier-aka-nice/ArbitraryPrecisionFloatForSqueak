mathematical functions
erf
	"Answer the error function of the receiver, that is
	2/pi sqrt*([:t | t squared negated exp] integrateFrom: 0 to: self)."
	| sumBits tmp |
	self isZero ifTrue: [^self].
	self negative ifTrue: [^self abs erf negated].
	sumBits := nBits * 2 + 8 + (self squared rounded * 4 max: 0).
	tmp := (self asArbitraryPrecisionFloatNumBits: sumBits) powerExpansionUnscaledErfPrecision: nBits + 16.
	^(tmp timesTwoPower: 1) / tmp pi sqrt
		asArbitraryPrecisionFloatNumBits: nBits