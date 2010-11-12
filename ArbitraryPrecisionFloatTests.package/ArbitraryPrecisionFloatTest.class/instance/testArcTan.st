testing-trigonometry
testArcTan
	| badArcTan |
	badArcTan := OrderedCollection new.
	-5 to: 5 by: 1/10 do: [:y |
		| arb dbl |
		arb := y asArbitraryPrecisionFloatNumBits: Float precision.
		self assert: ((y arcTan - arb arcTan) abs <= y arcTan ulp
			or:
				[badArcTan add: y.
				dbl := arb asArbitraryPrecisionFloatNumBits: Float precision *2.
				(dbl arcTan asArbitraryPrecisionFloatNumBits: Float precision) = arb arcTan])].
	badArcTan isEmpty ifFalse: [Transcript cr; show: 'bad arcTan for ' , badArcTan printString]