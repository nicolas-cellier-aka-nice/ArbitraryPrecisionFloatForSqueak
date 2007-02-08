printing
printOn: aStream base: base
	aStream nextPut: $(; nextPutAll: self class name.
	aStream space; nextPutAll: 'mantissa:'; space.
	mantissa printOn: aStream base: base.
	aStream space; nextPutAll: 'exponent:'; space.
	biasedExponent printOn: aStream base: base.
	aStream space; nextPutAll: 'nBits:'; space; print: nBits.
	aStream nextPut: $)