testing-functions
testExpLn
	self assert: (1 asArbitraryPrecisionFloatNumBits: Float precision) exp asFloat = 1 asFloat exp.

	self assert: (5 asArbitraryPrecisionFloatNumBits: Float precision) exp asFloat = 5 asFloat exp.
	self assert: ((5 asArbitraryPrecisionFloatNumBits: Float precision) exp ln asFloat - 5 asFloat exp ln) <= 5.0 ulp.