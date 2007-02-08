private
inPlaceReciprocal
	| ma h |
	self isZero ifTrue: [(ZeroDivide dividend: self) signal].
	ma := mantissa abs.
	h := ma highBit + 1.
	"this one would be inefficient, we have to open code it
		m := ((1 bitShift: h + nBits) / mantissa) rounded.
	it is also:
		((num/den)+(sign/2)) truncated
	it is also:
		(num*2)+(sign*den) quo: den*2"
		
	mantissa := (1 bitShift: h + nBits + 1) + ma quo: (self shift: mantissa by: 1).
	biasedExponent := biasedExponent negated - h - nBits.
	self round