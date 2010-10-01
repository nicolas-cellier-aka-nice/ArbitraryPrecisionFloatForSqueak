testing-functions
testErf
	<timeout: 5 "seconds">
	| serie |
	serie := ((0 to: 10) , (1/10 to: 9/10 by: 1/10)) collect: [:e | e asFloat].
	self checkDoublePrecisionSerie: serie forFunction: #erf