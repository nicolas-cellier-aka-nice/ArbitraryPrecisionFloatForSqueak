testing-arithmetic
testPi
	"check computation of pi"

	self assert: (1 asArbitraryPrecisionFloatNumBits: Float precision) pi = Float pi.