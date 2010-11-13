private
testDoublePrecisionSerie: serie forFunction: func 
	serie do: [:y |
		| arb dbl farb fdbl |
		arb := y asArbitraryPrecisionFloatNumBits: Float precision.
		dbl := arb asArbitraryPrecisionFloatNumBits: Float precision * 2.
		farb := arb perform: func.
		fdbl := (dbl perform: func) asArbitraryPrecisionFloatNumBits: Float precision.
		self assert: (fdbl - farb) isZero]