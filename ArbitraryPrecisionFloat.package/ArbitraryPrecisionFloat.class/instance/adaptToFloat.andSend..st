converting
adaptToFloat: rcvr andSend: selector
	^(rcvr asArbitraryPrecisionFloatNumBits: Float precision) perform: selector with: self