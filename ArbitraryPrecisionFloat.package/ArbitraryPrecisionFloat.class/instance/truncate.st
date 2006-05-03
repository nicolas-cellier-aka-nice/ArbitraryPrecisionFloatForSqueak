private
truncate
	| delta |
	delta := mantissa abs highBit - nBits.
	delta > 0
		ifTrue: [mantissa := self shift: mantissa by: delta negated.
			exponent := exponent + delta]