testing-converting
testAsFloatWithUnderflowAndExcessPrecision
	| fmin expected shouldRoundUp shouldRoundDown tooSmall exactTie |
	fmin := Float fmin asArbitraryPrecisionFloatNumBits: Float precision * 2.

	shouldRoundUp := (fmin timesTwoPower: 1) + (fmin timesTwoPower: -1) + (fmin timesTwoPower: -1 - Float precision).
	expected := Float fmin * 3.
	self assert: shouldRoundUp asFloat = expected.
	self assert: shouldRoundUp negated asFloat = expected negated.

	shouldRoundDown := (fmin timesTwoPower: 1) +(fmin timesTwoPower: -1 - Float precision).
	expected := Float fmin * 2.
	self assert: shouldRoundDown asFloat = expected.
	self assert: shouldRoundDown negated asFloat = expected negated.

	tooSmall := (fmin negated timesTwoPower: -2).
	self assert: tooSmall asFloat isZero.
	self assert: tooSmall asFloat sign = -1..

	exactTie := (Float fminNormalized predecessor asArbitraryPrecisionFloatNumBits: Float precision * 2) + (fmin/2).
	expected := Float fminNormalized.
	self assert: exactTie asFloat = expected.
	self assert: exactTie negated asFloat = expected negated.
