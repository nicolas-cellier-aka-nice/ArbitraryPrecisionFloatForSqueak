I store floating point numbers with some arbitrary precision (instance variable nBits).
Unlike Float, mantissa is not normalized under the form 1.mmmmmm
It is just stored as an integer with the number sign.
Exponent is the power of two that multiply the mantissa to form the number. there is no limitation of exponent (overflow or underflow), unless you succeed in exhausting the VM memory...

Like Float, my arithmetic operations are inexact. They will round to nearest nBits ArbitraryPrecisionFloat.

If two different precisions are used in arithmetic, the result is expressed in the higher precision.

Default operating mode is rounding, but might be one of the other possibility (tuncate floor ceiling).