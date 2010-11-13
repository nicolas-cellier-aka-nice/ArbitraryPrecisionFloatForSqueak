testing-trigonometry
testArcSin
	<timeout: 10 "seconds">
	| badArcSin |
	badArcSin := self testDoublePrecisionSerieVsFloat: (-1 to: 1 by: 1/20) forFunction: #arcSin.
	badArcSin isEmpty ifFalse: [Transcript cr; show: 'bad arcSin for ' , badArcSin printString]