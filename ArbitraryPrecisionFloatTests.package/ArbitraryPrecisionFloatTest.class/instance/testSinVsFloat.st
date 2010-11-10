testing-trigonometry
testSinVsFloat
	-720 to: 720 do: [:i |
		| rad arb |
		rad := i degreesToRadians.
		arb := rad asArbitraryPrecisionFloatNumBits: 53.
		self assert: (rad sin - arb sin) abs <= (5 * 1.0 ulp)].