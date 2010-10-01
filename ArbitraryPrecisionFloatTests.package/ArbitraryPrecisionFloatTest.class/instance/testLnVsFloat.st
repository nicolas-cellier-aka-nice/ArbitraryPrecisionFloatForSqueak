testing-functions
testLnVsFloat
	1 to: 100
		do: 
			[:v | 
			self assert: (v asArbitraryPrecisionFloatNumBits: 53) ln asFloat 
						= v asFloat ln]