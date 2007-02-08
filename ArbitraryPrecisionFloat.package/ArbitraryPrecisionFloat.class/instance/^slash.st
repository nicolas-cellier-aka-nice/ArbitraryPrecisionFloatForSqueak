arithmetic
/ aNumber 
	| n |
	aNumber class = self class
		ifFalse: [^ aNumber adaptToArbitraryPrecisionFloat: self andSend: #/].
	n := nBits max: aNumber numBits.
	^ (self asArbitraryPrecisionFloatNumBits: n)
		divideBy: (aNumber asArbitraryPrecisionFloatNumBits: n)