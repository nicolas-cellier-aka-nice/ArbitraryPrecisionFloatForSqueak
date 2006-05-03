private
inPlaceMultiplyBy: b andAccumulate: c 
	"only do rounding after the two operations"
	
	| delta |
	mantissa := mantissa * b mantissa.
	exponent := exponent + b exponent.
	c isZero
		ifFalse:
			[delta := exponent - c exponent.
			mantissa := delta isZero
						ifTrue: [mantissa + c mantissa]
						ifFalse: [delta > 0
								ifTrue:
									[exponent := exponent - delta.
									(self shift: mantissa by: delta ) + c mantissa]
								ifFalse: [mantissa
										+ (self shift: c mantissa by: delta negated)]]].
	self round