private
normalize
	| delta |
	mantissa isZero
		ifTrue: [exponent := 0]
		ifFalse: [self round.
			delta := mantissa abs highBit - nBits.
			delta < 0
				ifTrue: [mantissa := self shift: mantissa by: delta negated.
					exponent := exponent + delta]]