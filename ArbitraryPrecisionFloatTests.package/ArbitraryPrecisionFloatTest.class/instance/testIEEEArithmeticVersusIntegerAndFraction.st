testing-arithmetic
testIEEEArithmeticVersusIntegerAndFraction
	"check that results are the same as IEEE 754 accelerated hardware
	WARNING: this cannot be the case for denormalized numbers (gradual underflow)
	because our exponent is unlimited"

	| floats ops ref new intAndFractions |
	floats := #(1.0 2.0 3.0 5.0 10.0 0.5 0.25 1.0e60 0.1 1.1e-30 1.0e-60) asOrderedCollection.
	-1 to: 1 do: [:pow | floats add: (1.0 timesTwoPower: Float precision + pow); add: (1.0 timesTwoPower: (Float precision + pow) negated)].
	floats add: Float pi.
	intAndFractions := #(1 3 5 10 12345678901234567890 -1 -22 -3 1.2s1) copyWith: 7/9.
	intAndFractions := intAndFractions , (intAndFractions collect: [:e | e reciprocal]).
	
	ops := 1/10 = 0.1
		ifTrue: [#(#+ #- #* #/)]
		ifFalse: [#(#+ #- #* #/ #= #< #>)]. "BEWARE: ArbitraryPrecisionFloat compare exactly, Float don't, unless http://bugs.squeak.org/view.php?id=3374"
	ops do: 
			[:op | 
			floats do: 
					[:f1 | 
					intAndFractions do: 
							[:f2 | 
							ref := f1 perform: op with: f2 asFloat.
							new := (f1 asArbitraryPrecisionFloatNumBits: Float precision) perform: op
										with: (f2 asArbitraryPrecisionFloatNumBits: Float precision).
							self assert: new = ref.
							new := f1 perform: op
										with: (f2 asArbitraryPrecisionFloatNumBits: Float precision).
							self assert: new = ref.
							
							ref := f1 perform: op with: f2.
							new := (f1 asArbitraryPrecisionFloatNumBits: Float precision) perform: op
										with: f2.
							self assert: new = ref.
							
							ref := f2 asFloat perform: op with: f1.
							new := (f2 asArbitraryPrecisionFloatNumBits: Float precision) perform: op
										with: (f1 asArbitraryPrecisionFloatNumBits: Float precision).
							self assert: new = ref.
							new := (f2 asArbitraryPrecisionFloatNumBits: Float precision) perform: op with: f1.
							self assert: new = ref.
							
							ref := f2 perform: op with: f1.
							new := f2 perform: op
										with: (f1 asArbitraryPrecisionFloatNumBits: Float precision).
							self assert: new = ref]]]