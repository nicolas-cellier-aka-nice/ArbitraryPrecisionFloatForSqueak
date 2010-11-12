testing-trigonometry
testArcCos
	| badArcCos |
	badArcCos := OrderedCollection new.
	-1 to: 1 by: 1/20 do: [:y |
		| arb dbl |
		arb := y asArbitraryPrecisionFloatNumBits: Float precision.
		self assert: ((y arcCos - arb arcCos) abs <= y arcCos ulp
			or:
				[badArcCos add: y.
				dbl := arb asArbitraryPrecisionFloatNumBits: Float precision *2.
				(dbl arcCos asArbitraryPrecisionFloatNumBits: Float precision) = arb arcCos])].
	badArcCos isEmpty ifFalse: [Transcript cr; show: 'bad arcCos for ' , badArcCos printString]