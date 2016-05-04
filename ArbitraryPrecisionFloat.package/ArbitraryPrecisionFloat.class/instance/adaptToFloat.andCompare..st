converting
adaptToFloat: rcvr andCompare: selector
	^rcvr isFinite
		ifTrue: [ (rcvr asArbitraryPrecisionFloatNumBits: Float precision) perform: selector with: self ]
		ifFalse: [ rcvr perform: selector with: self asFloat ]