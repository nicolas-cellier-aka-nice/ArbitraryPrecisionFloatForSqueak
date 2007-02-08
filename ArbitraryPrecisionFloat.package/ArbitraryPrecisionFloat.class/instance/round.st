private
round
	"apply algorithm round to nearest even used by IEEE arithmetic"
	
	| delta ma carry |
	mantissa isZero 
		ifTrue: 
			[biasedExponent := 0.
			^self].
	ma := mantissa abs.
	delta := ma highBit - nBits.
	delta > 0 
		ifTrue: 
			["inexact := ma lowBit <= delta."
			carry := (ma anyMask: (1 bitShift: delta - 1)) ifTrue: [1] ifFalse: [0].
			mantissa := self shift: mantissa by: delta negated.
			biasedExponent := biasedExponent + delta.
			(carry = 1 and: [mantissa odd or: [ma lowBit < delta]]) 
				ifTrue: 
					[mantissa := mantissa + mantissa sign.
					self truncate]]