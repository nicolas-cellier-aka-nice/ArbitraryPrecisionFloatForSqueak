converting
asTrueFraction
	^ exponent >= 0
		ifTrue: [self shift: mantissa by: exponent]
		ifFalse: [mantissa
				/ (1 bitShift: exponent negated)]