testing-functions
testLn
	<timeout: 10 "seconds">
	| badLn |
	badLn := self testDoublePrecisionSerieVsFloat: (1 to: 100) forFunction: #ln.
	badLn isEmpty ifFalse: [Transcript cr; show: 'bad ln for ' , badLn printString]