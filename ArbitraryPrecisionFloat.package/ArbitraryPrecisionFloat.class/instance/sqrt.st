mathematical functions
sqrt
	"Answer the square root of the receiver."

	| decimalPlaces n norm guess previousGuess one stopIteration |
	self < 0 
		ifTrue: 
			[^self class 
				raise: #imaginaryResultSignal
				receiver: self
				selector: #sqrt
				errorString: #errSquareRootNegativeNumber << #dialogs 
						>> 'Can''t take square root of negative number'].


	"use additional bits"
	decimalPlaces := nBits + 16.

	"constants"
	one := 1 asArbitraryPrecisionFloatNumBits: decimalPlaces.
	one normalize.
	n := self asArbitraryPrecisionFloatNumBits: decimalPlaces.

	"normalize n"
	norm := n exponent quo: 2.
	n := n timesTwoPower: norm * -2.

	"Initial guess for sqrt(1/n)"
	previousGuess := self class 
				mantissa: 1
				exponent: (n exponent negated quo: 2)
				nBits: decimalPlaces.
	guess := previousGuess copy.

	"use iterations x(n+1) := x*( 1 +  (1-x*x*n)/2) to guess sqrt(1/n)"
	
	[guess inPlaceMultiplyNoRoundBy: guess.
	guess inPlaceMultiplyBy: n.
	guess inPlaceNegated.
	guess inPlaceAddNoRound: one.

	"stop when no evolution of numBits + 12 first bits"
	stopIteration := guess isZero or: [guess exponent < (decimalPlaces - 4) negated].
	guess inPlaceTimesTwoPower: -1.
	guess inPlaceAddNoRound: one.
	guess inPlaceMultiplyNoRoundBy: previousGuess.
	guess negative ifTrue: [guess inPlaceNegated].

	stopIteration] 
			whileFalse: 
				[guess round.
				previousGuess inPlaceCopy: guess].

	"multiply by n and un-normalize"
	guess inPlaceMultiplyBy: n.
	guess inPlaceTimesTwoPower: norm.
	^guess asArbitraryPrecisionFloatNumBits: nBits