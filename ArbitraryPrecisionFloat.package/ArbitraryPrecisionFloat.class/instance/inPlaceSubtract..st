private
inPlaceSubtract: b 
	| delta |
	b isZero ifTrue: [^self round].
	self isZero 
		ifTrue: 
			[mantissa := b mantissa negated.
			biasedExponent := b biasedExponent]
		ifFalse: 
			[biasedExponent = b biasedExponent
				ifTrue: [mantissa := mantissa - b mantissa]
				ifFalse: 
					["check for early truncation. beware, keep 1 bit for rounding"

					delta := self exponent - b exponent.
					delta > (nBits max: self numBitsInMantissa) 
						ifFalse: 
							[delta negated > (nBits max: b numBitsInMantissa) 
								ifTrue: 
									[mantissa := b mantissa negated.
									biasedExponent := b biasedExponent]
								ifFalse: 
									[delta := biasedExponent - b biasedExponent.
									delta >= 0 
										ifTrue: 
											[mantissa := (self shift: mantissa by: delta) - b mantissa.
											biasedExponent := biasedExponent - delta]
										ifFalse: [mantissa := mantissa - (self shift: b mantissa by: delta negated)]]]]].
	self round