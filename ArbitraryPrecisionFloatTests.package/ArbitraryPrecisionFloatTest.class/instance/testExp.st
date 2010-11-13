testing-functions
testExp
	<timeout: 10 "seconds">
	| badExp |
	badExp := self testDoublePrecisionSerieVsFloat: (-100 to: 100) forFunction: #exp.
	badExp isEmpty ifFalse: [Transcript cr; show: 'bad exp for ' , badExp printString]