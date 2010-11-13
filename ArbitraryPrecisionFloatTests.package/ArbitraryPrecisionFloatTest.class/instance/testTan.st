testing-trigonometry
testTan
	<timeout: 10 "seconds">
	| badTan |
	badTan := self testDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #tan.
	badTan isEmpty ifFalse: [Transcript cr; show: 'bad tan for angles (degrees) ' , (badTan collect: [:i | i radiansToDegrees rounded]) printString]