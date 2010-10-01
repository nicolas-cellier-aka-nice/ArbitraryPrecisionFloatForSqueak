testing-functions
testSqrt
	self assert: (2 asArbitraryPrecisionFloatNumBits: 53) sqrt asFloat = 2 asFloat sqrt.

	"knowing that (10**3) < (2**10), 100 bits are enough for representing 10**30 exactly"
	self assert: ((10 raisedTo: 30) asArbitraryPrecisionFloatNumBits: 100) sqrt = (10 raisedTo: 15)