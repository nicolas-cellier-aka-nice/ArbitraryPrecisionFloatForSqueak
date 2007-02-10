accessing
nextTowardPositiveInfinity
	"answer the nearest floating point number greater than self with same precision than self"

	self normalize.
	^self class new 
		mantissa: mantissa + 1
		exponent: biasedExponent
		nBits: nBits