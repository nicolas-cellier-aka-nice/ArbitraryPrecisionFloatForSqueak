private
reduce
	"remove trailing zero bits from mantissa so that we can do arithmetic on smaller integer
	(that will un-normalize self)"
	
	| delta |
	delta := mantissa abs lowBit - 1.
	delta > 0
		ifTrue: [mantissa := self shift: mantissa by: delta negated.
			biasedExponent := biasedExponent + delta]