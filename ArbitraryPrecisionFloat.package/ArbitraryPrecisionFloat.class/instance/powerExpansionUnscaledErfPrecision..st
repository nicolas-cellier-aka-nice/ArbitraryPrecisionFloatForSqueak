private
powerExpansionUnscaledErfPrecision: precBits
	"Evaluate the unscaled erf function of the receiver by power series expansion.
	unscaledErf (x) = integral of exp(-t*t)*dt from 0 to x
	This is the power serie: sum of terms (-1)^n*x^(2n+1)/(n!*(2n+1)) from 0 to infinity"
	
	| k x4k erf pos neg term x2f x4 |
	k := 0.
	x2f := self asFraction squared.
	x4 := self squared squared.	"exactly rounded thanks to double precision"
	x4k := self one.
	erf := self zero.
	
	[pos := 1 / (k*4+1).
	neg := x2f / ((k*4+3)*(k*2+1)).
	term := pos - neg * x4k.
	erf inPlaceAdd: term.
	k := k + 1.
	x4k inPlaceMultiplyBy: x4 / (k*2-1*k*2).
	term exponent + precBits < (self exponent min: 0)] whileFalse.
	^(erf inPlaceMultiplyBy: self) asArbitraryPrecisionFloatNumBits: precBits