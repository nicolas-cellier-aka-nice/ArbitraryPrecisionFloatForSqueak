converting
asFloat
	"Convert to a IEEE 754 double precision floating point.
	Take care of IEEE handling of Underflow."
	
	| e n |
	e := self exponent.
	n := e > -1023
		ifTrue: [53]
		ifFalse: [53+e+1022].
	nBits > n ifTrue: [^(self copy setPrecisionTo: n) asFloat].
	^mantissa asFloat timesTwoPower: biasedExponent