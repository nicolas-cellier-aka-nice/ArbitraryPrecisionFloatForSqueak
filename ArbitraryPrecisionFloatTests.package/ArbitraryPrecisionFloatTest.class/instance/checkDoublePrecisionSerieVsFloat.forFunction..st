private
checkDoublePrecisionSerieVsFloat: serie forFunction: func 
	^serie reject: [:y |
		| arb dbl farb fdbl |
		arb := y asArbitraryPrecisionFloatNumBits: Float precision.
		dbl := arb asArbitraryPrecisionFloatNumBits: Float precision * 2.
		farb := arb perform: func.
		fdbl := (dbl perform: func) asArbitraryPrecisionFloatNumBits: Float precision.
		self assert: (fdbl - farb) isZero.
		[(y asFloat perform: func) = farb] on: ZeroDivide do: [false]]