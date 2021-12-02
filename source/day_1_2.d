
import util;

import std.algorithm;
import std.array;
import std.range;
import std.string;

int compute(string data)() {
	immutable string[] lines = data.splitLines();

	int[] numbers = lines
		.map!(to!int).array;

	return cast(int) numbers.slide!(No.withPartial)(3)
		.zip(numbers[1..$].slide!(No.withPartial)(3))
		.filter!"a[0].sum < a[1].sum"
		.array.length;
}

mixin(makeDay!1);
