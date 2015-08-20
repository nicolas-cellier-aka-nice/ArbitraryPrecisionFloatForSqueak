converting
adaptToFloat: rcvr andCompare: selector
	^(rcvr asArbitraryPrecisionFloatNumBits: Float precision) perform: selector with: self