printing
printOn: aStream
	aStream nextPut: $(; nextPutAll: self class name; space; nextPutAll: #new.
	aStream space; nextPutAll: 'mantissa:'; space; print: mantissa.
	aStream space; nextPutAll: 'exponent:'; space; print: exponent.
	aStream space; nextPutAll: 'nBits:'; space; print: nBits.
	aStream nextPut: $)