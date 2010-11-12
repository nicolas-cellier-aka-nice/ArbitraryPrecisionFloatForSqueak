testing-trigonometry
testArcSin
	| badArcSin |
	badArcSin := OrderedCollection new.
	-1 to: 1 by: 1/20 do: [:y |
		| arb dbl |
		arb := y asArbitraryPrecisionFloatNumBits: Float precision.
		self assert: ((y arcSin - arb arcSin) abs <= y arcSin ulp
			or:
				[badArcSin add: y.
				dbl := arb asArbitraryPrecisionFloatNumBits: Float precision *2.
				(dbl arcSin asArbitraryPrecisionFloatNumBits: Float precision) = arb arcSin])].
	badArcSin isEmpty ifFalse: [Transcript cr; show: 'bad arcSin for ' , badArcSin printString]