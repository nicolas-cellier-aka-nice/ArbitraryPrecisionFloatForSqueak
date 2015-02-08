private
powerExpansionLn
	"Evaluate self ln by power series expansion.
	For quadratic convergence, use:
	ln ((1+y)/(1-y)) = 2 y (1 + y^2/3 + y^4/5 + ... )
	(1+y)/(1-y) = self => y = (self-1)/(self+1)
	This algorithm is only interesting when self is close to 1"
	
	| one y y2 two count sum term |
	one := self one.
	y := (self - one)/(self + one).
	
	two := one timesTwoPower: 1.
	count := one copy.
	sum := one copy.
	term := one copy.
	y2 := y squared.
	
	[term inPlaceMultiplyBy: y2.
	count inPlaceAdd: two.
	sum inPlaceAdd: term / count.
	term exponent + nBits < sum exponent] whileFalse.
	sum inPlaceMultiplyBy: y; inPlaceTimesTwoPower: 1.
	^sum