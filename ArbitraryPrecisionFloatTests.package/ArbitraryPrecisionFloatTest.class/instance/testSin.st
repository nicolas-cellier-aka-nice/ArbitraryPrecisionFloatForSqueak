testing-trigonometry
testSin
	-720 to: 720 do: [:i |
		| rad arb |
		rad := i degreesToRadians.
		arb := rad asArbitraryPrecisionFloatNumBits: 53.
		self assert: (rad sin - arb sin) abs <= rad sin ulp].