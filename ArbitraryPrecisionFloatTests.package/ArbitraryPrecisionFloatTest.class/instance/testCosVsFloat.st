testing-trigonometry
testCosVsFloat
	-720 to: 720 do: [:i |
		| rad arb |
		rad := i degreesToRadians.
		arb := rad asArbitraryPrecisionFloatNumBits: 53.
		self assert: (rad cos - arb cos) abs <= (1.0 ulp * 5)].