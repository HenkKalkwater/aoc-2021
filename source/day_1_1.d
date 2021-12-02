import util;

import std.algorithm;
import std.array;
import std.range;
import std.string;

int compute(string data)() {
	immutable string[] lines = data.splitLines();
	int count = 0;
	int number = 0;
	int lastNumber = int.max;

	// The following naive implementation eats at least 8GiB memory on my PC
	/*static foreach(line; lines) {
		number = to!string(line);
		pragma(msg, number, lastNumber);
		static if (lastNumber < number) count++;
		lastNumber = number;
	}*/
	int[] numbers = lines
		.map!(to!int).array;

	return cast(int) numbers.zip(numbers[1..$]).filter!"a[0] < a[1]".array.length;
}

mixin(makeDay!1);
