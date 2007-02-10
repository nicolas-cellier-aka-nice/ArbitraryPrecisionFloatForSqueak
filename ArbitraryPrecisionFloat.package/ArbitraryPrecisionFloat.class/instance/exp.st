mathematical functions
exp
	"Answer the exponential of the receiver."

	| ln2 x q r ri res n maxIter p |

	"Use following decomposition:
		x exp = (2 ln * q + r) exp.
		x exp = (2**q * r exp)"
	ln2 := 2 ln.
	x := self / ln2.
	q := x truncated.
	r := (x - q) * ln2.

	"now compute r exp by power series expansion
	we compute (r/(2**p)) exp ** (2**p) in order to have faster convergence"
	p := 10 min: nBits // 2.
	r := r timesTwoPower: p negated.
	ri := self class 
				mantissa: 1
				exponent: 0
				nBits: nBits + 16.
	res := self class 
				mantissa: 1
				exponent: 0
				nBits: nBits + 16.
	n := 0.
	maxIter := 1 + ((nBits + 16) / p) ceiling.
	[n <= maxIter] whileTrue: 
			[n := n + 1.
			ri inPlaceMultiplyBy: r / n.
			res inPlaceAdd: ri].
	p timesRepeat: [res inPlaceMultiplyBy: res].
	res inPlaceTimesTwoPower: q.

	"now use a Newton iteration to refine the result
	res = res * (self - res ln + 1)"

	2 timesRepeat: [res inPlaceMultiplyBy: (self - res ln + 1)].
	
	^res asArbitraryPrecisionFloatNumBits: nBits