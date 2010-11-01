private
cos: x
	"Evaluate the cosine of x by cos(4x) formula and power series expansion."
	
	| cos cos2 cos4 quarter |
	quarter := x timesTwoPower: -2.
	cos := self powerExpansionCos: quarter.
	cos2 := cos squared.
	cos4 := cos2 squared.
	^cos4
		inPlaceSubtract: cos2;
		inPlaceTimesTwoPower: 3;
		inPlaceAdd: cos one;
		yourself
	