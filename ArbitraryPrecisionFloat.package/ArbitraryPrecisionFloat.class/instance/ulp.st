truncation and round off
ulp
	mantissa = 0 ifTrue: [^self].
	^(1 asArbitraryPrecisionFloatNumBits: nBits) timesTwoPower: self exponent - nBits + 1