private
inPlaceMultiplyBy: b
	mantissa := mantissa * b mantissa.
	exponent := exponent + b exponent.
	self round