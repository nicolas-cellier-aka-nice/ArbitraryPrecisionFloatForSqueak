converting
truncated
	^ exponent negated > mantissa abs highBit
		ifTrue: [0]
		ifFalse: [self shift: mantissa by: exponent]