testing-arithmetic
testHardestToRoundPower
	"This is an extremely hard to round value because very near to exact tie.
	(notice the 59 consecutives zeroes of highPrecisionResult after bit #54)
	Example taken from http://perso.ens-lyon.fr/jean-michel.muller/Conf-Journees-Knuth.pdf"
	| highPrecisionResult pow x |
	x := 2r1.0100010111101011011011101010011111100101000111011101.
	pow := 51.
	highPrecisionResult := 2r1.1011001110100100011100100001100100000101101011101110100000000000000000000000000000000000000000000000000000000000100e17.
	self assert: ((x asArbitraryPrecisionFloatNumBits: Float precision) raisedTo: pow) = highPrecisionResult.