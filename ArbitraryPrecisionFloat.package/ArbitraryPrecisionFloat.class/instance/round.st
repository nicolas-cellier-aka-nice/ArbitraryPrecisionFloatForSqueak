private
round
	"apply algorithm round to nearest even used by IEEE arithmetic"
	
	| delta ma mask trailingBits carry |
	mantissa isZero ifTrue: [exponent := 0. ^self].
	ma := mantissa abs.
	delta := ma highBit - nBits.
	delta > 0
		ifTrue:
			[mask := (1 bitShift: delta) - 1.
			trailingBits := ma bitAnd: mask.
			"inexact := trailingBits isZero not."
			carry := trailingBits bitShift: 1 - delta.
			mantissa := self shift: mantissa by: delta negated.
			exponent := exponent + delta.
			(carry isZero or: [(trailingBits bitAnd: (mask bitShift: -1)) isZero and: [mantissa even]])
				ifFalse:
					[mantissa := mantissa + mantissa sign.
					mantissa abs highBit > nBits
						ifTrue: [self truncate]]]