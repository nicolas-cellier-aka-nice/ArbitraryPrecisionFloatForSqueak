testing-functions
testLnVsFloat
	<timeout: 10 "seconds">
	| badFloat |
	badFloat := OrderedCollection new.
	1 to: 100
		do: 
			[:v | 
			self assert: ((v asArbitraryPrecisionFloatNumBits: 53) ln asFloat 
						= v asFloat ln or: 
								[badFloat add: v.
								(v asArbitraryPrecisionFloatNumBits: 100) ln asFloat 
									= (v asArbitraryPrecisionFloatNumBits: 53) ln])].
	Transcript cr; show: 'Bad float vis a vis ln function: ' , badFloat printString