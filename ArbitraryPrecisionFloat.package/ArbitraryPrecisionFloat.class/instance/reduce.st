private
reduce
	"remove trailing zero bits from mantissa
	(that will un-normalize)"
	
	| delta |
	delta := mantissa abs lowBit - 1.
	delta > 0
		ifTrue: [mantissa := self shift: mantissa by: delta negated.
			exponent := exponent + delta]