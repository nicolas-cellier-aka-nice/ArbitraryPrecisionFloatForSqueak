testing-trigonometry
testCos
	| badCos |
	badCos := OrderedCollection new.
	-720 to: 720 do: [:i |
		| rad arb dbl |
		rad := i degreesToRadians.
		arb := rad asArbitraryPrecisionFloatNumBits: 53.
		self assert: ((rad cos - arb cos) abs <= rad cos ulp
			or:
				[badCos add: i.
				dbl := arb asArbitraryPrecisionFloatNumBits: 106.
				(dbl cos asArbitraryPrecisionFloatNumBits: 53) = arb cos])].
	badCos isEmpty ifFalse: [Transcript cr; show: 'bad cos for angles (degree) ' , badCos printString]