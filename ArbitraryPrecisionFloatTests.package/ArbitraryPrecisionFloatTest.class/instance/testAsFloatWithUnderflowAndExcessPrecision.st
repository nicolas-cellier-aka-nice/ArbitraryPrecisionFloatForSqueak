testing-converting
testAsFloatWithUnderflowAndExcessPrecision
	| fmin expected shouldRoundUpper |
	fmin := Float fmin asArbitraryPrecisionFloatNumBits: Float precision * 2.
	shouldRoundUpper := (fmin timesTwoPower: 1) + (fmin timesTwoPower: -1) + (fmin timesTwoPower: -1 - Float precision).
	expected := Float fmin * 3.
	self assert: shouldRoundUpper asFloat = expected