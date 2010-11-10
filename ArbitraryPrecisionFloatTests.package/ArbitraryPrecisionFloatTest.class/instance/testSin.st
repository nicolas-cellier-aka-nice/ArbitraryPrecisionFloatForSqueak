testing-trigonometry
testSin
	| badSin |
	badSin := OrderedCollection new.
	-720 to: 720 do: [:i |
		| rad arb dbl |
		rad := i degreesToRadians.
		arb := rad asArbitraryPrecisionFloatNumBits: 53.
		self assert: ((rad sin - arb sin) abs <= rad sin ulp
			or:
				[badSin add: i.
				dbl := arb asArbitraryPrecisionFloatNumBits: 106.
				(dbl sin asArbitraryPrecisionFloatNumBits: 53) = arb sin])].
	badSin isEmpty ifFalse: [Transcript cr; show: 'bad sin for angles (degree) ' , badSin printString]