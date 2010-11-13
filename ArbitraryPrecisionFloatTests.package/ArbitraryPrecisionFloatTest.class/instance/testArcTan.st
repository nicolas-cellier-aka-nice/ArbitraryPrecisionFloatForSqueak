testing-trigonometry
testArcTan
	<timeout: 10 "seconds">
	| badArcTan |
	badArcTan := self testDoublePrecisionSerieVsFloat: (-5 to: 5 by: 1/10) forFunction: #arcTan.
	badArcTan isEmpty ifFalse: [Transcript cr; show: 'bad arcTan for ' , badArcTan printString]