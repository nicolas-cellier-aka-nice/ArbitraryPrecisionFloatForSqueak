testing-trigonometry
testSin
	<timeout: 10 "seconds">
	| badSin |
	badSin := self testDoublePrecisionSerieVsFloat: self trigonometricSerie forFunction: #sin.
	badSin isEmpty ifFalse: [Transcript cr; show: 'bad sin for angles (degrees) ' , (badSin collect: [:i | i radiansToDegrees rounded]) printString]