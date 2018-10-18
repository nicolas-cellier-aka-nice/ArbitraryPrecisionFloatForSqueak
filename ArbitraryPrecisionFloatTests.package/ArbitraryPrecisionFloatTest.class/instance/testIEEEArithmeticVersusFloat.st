testing-arithmetic
testIEEEArithmeticVersusFloat
	| floats ops ref new |
	floats := #(1.0 2.0 3.0 5.0 10.0 0.5 0.25 1.0e60 0.1 1.1e-30 1.0e-60) asOrderedCollection.
	-1 to: 1 do: [:pow | floats add: (1.0 timesTwoPower: Float precision + pow); add: (1.0 timesTwoPower: (Float precision + pow) negated)].
	floats add: Float pi.
	ops := #(#+ #- #* #/ #= #< #> ).
	ops
		do: [:op | floats
				do: [:f1 | floats
						do: [:f2 | 
							ref := f1 perform: op with: f2.
							new := (f1 asArbitraryPrecisionFloatNumBits: Float precision)
										perform: op
										with: (f2 asArbitraryPrecisionFloatNumBits: Float precision).
							self assert: new = ref]]]