testing-compare
testIsAnExactFloat
	self assert: zero isAnExactFloat.
	self assert: one isAnExactFloat.
	self assert: minusTwo isAnExactFloat.

	self assert: (Float fmax asArbitraryPrecisionFloatNumBits: Float precision) isAnExactFloat.
	self deny: (Float fmax asArbitraryPrecisionFloatNumBits: Float precision) successor isAnExactFloat.

	self assert: (Float fmin negated asArbitraryPrecisionFloatNumBits: Float precision) isAnExactFloat.
	self deny: (Float fmin negated asArbitraryPrecisionFloatNumBits: Float precision) successor isAnExactFloat.

	self assert: (Float fmin asArbitraryPrecisionFloatNumBits: Float precision * 2) isAnExactFloat.
	self deny: ((Float fmin asArbitraryPrecisionFloatNumBits: Float precision * 2) * (3/2)) isAnExactFloat.