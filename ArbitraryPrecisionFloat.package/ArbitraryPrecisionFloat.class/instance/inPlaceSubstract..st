private
inPlaceSubstract: b 
	| delta |
	b isZero ifTrue: [^ self].
	self isZero
		ifTrue:
			[mantissa := b mantissa negated.
			exponent := b exponent]
		ifFalse:
			[delta := exponent - b exponent.
			delta isZero
				ifTrue: [mantissa := mantissa - b mantissa]
				ifFalse: [delta > (b numBits "+ 1")
						ifFalse: [delta negated > (nBits "+ 1")
								ifTrue:
									[mantissa := b mantissa negated.
									exponent := b exponent]
								ifFalse: [delta >= 0
										ifTrue:
											[mantissa := (self shift: mantissa by: delta) - b mantissa.
											exponent := exponent - delta]
										ifFalse: [mantissa := mantissa
												- (self shift: b mantissa by: delta negated)]]]]].
	self round