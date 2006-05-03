private
inPlaceDivideBy: y 
	"reference http://citeseer.ist.psu.edu/rd/34625967%2C717775%2C1%2C0.25%2CDownload/http://citeseer.ist.psu.edu/cache/papers/cs2/516/http:zSzzSzperso.ens-lyon.frzSzjean-michel.mullerzSzDivIEEETC-aug04.pdf/brisebarre04accelerating.pdf"

	| zh x q |
	zh := y reciprocal.
	x := self copy.
	self inPlaceMultiplyBy: zh.
	q := self copy.
	"r := "self inPlaceMultiplyBy: y negated andAccumulate: x.
	"q' := "self inPlaceMultiplyBy: zh andAccumulate: q.

	"ALGO 4
	| zh r zl |
	zh := b reciprocal.
	r := b negated inPlaceMultiplyBy: zh andAccumulate: (1 asArbitraryPrecisionFloatNumBits: nBits).
	zl := (b asArbitraryPrecisionFloatNumBits: nBits + 1) reciprocal inPlaceMultiplyBy: r.
	self inPlaceMultiplyBy: zh andAccumulate: (zl inPlaceMultiplyBy: self)"