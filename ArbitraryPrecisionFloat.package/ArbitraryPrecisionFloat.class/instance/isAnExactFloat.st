testing
isAnExactFloat
	^self exponent <= Float emax
		and: [Float emin - Float precision < self exponent
		and: [Float emin <= self exponent 
			ifTrue: [nBits <= Float precision or: [mantissa isAnExactFloat]]
			ifFalse: ["gradual underflow"
				mantissa abs lowBit + biasedExponent - 1 > (Float emin - Float precision)]]]