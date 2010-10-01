testing-functions
testExpVsFloat
	"Test if we find same results as double precision exp function.
	Unfortunately, we cannot trust native exp function too much...
	it appears to incorrectly round last bit sometimes (at least with x86)"

	| badFloat |
	badFloat := OrderedCollection new.
	-100 to: 100
		do: 
			[:v | 
			self 
				assert: ((v asArbitraryPrecisionFloatNumBits: 53) exp asFloat 
						= v asFloat exp or: 
								[badFloat add: v.
								(v asArbitraryPrecisionFloatNumBits: 100) exp asFloat 
									= (v asArbitraryPrecisionFloatNumBits: 53) exp])].
	Transcript cr; show: 'Bad float vis a vis exp function: ' , badFloat printString