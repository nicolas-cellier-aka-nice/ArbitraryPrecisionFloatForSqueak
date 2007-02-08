private
truncate
	"remove trailing bits if they exceed our allocated number of bits"

	| delta |
	delta := self numBitsInMantissa - nBits.
	delta > 0 
		ifTrue: 
			[mantissa := self shift: mantissa by: delta negated.
			biasedExponent := biasedExponent + delta]