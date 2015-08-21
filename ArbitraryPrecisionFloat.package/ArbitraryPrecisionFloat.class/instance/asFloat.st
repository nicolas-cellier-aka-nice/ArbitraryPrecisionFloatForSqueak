converting
asFloat
	"Convert to a IEEE 754 double precision floating point."
	
	| float scaled |
	nBits <= Float precision ifTrue: [^mantissa asFloat timesTwoPower: biasedExponent].
	self exponent >= Float emin ifTrue: [^(self copy setPrecisionTo: Float precision) asFloat].
	"In case of gradual underflow, keep significand + one excess bit (tie)"
	scaled := self timesTwoPower: Float precision - Float emin.
	float := scaled integerPart asFloat.
	"check for excess bits, and let the machine do the rounding for us"
	scaled fractionPart isZero ifFalse: [float := float + (self negative ifTrue: [-0.5] ifFalse: [0.5])].
	(float isZero and: [self negative]) ifTrue: [^Float negativeZero].
	^float timesTwoPower: Float emin - Float precision