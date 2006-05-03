printing
printOn: aStream base: base
	aStream nextPut: $(; nextPutAll: self class name; space; nextPutAll: #new.
	aStream space; nextPutAll: 'mantissa:'; space.
	mantissa printOn: aStream base: base.
	aStream space; nextPutAll: 'exponent:'; space.
	exponent printOn: aStream base: base.
	aStream space; nextPutAll: 'nBits:'; space; print: nBits.
	aStream nextPut: $)