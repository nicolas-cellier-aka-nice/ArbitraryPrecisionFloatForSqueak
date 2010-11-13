testing-trigonometry
testArcCos
	<timeout: 10 "seconds">
	| badArcCos |
	badArcCos := self testDoublePrecisionSerieVsFloat: (-1 to: 1 by: 1/20) forFunction: #arcCos.
	badArcCos isEmpty ifFalse: [Transcript cr; show: 'bad arcCos for ' , badArcCos printString]