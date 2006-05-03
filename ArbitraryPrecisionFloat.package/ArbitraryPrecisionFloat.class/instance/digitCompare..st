private
digitCompare: b 
	"both are positive or negative.
	answer +1 if i am greater, -1 if i am smaller, 0 if equal"
	
	| compare |
	self isZero
		ifTrue: [b isZero
				ifTrue: [^ 0]
				ifFalse: [^ -1]].
	b isZero
		ifTrue: [^ 1].
	compare := (mantissa abs highBit + exponent - b mantissa abs highBit - b exponent) sign.
	^ compare = 0
		ifTrue: [(self - b) sign]
		ifFalse: [compare]