
import util;

import std.algorithm;
import std.format;
import std.string;
import std.typecons;

struct Pos {
	int x;
	int d;
	int a;
}

Pos createPos(int x, int d, int a) {
	return Pos(x,d, a);
}


int compute(string input)() {

	Pos begin = createPos(0,0,0);

	Pos result = input.lineSplitter
		.map!((line) {
			string cmd;
			int amount;
			assert(line.formattedRead!"%s %d"(cmd, amount) == 2);

			switch(cmd) {
			case "forward":
				return createPos(amount,0, 0);
			case "down":
				return createPos(0,0,  amount);
			case "up":
				return createPos(0,0, -amount);
			default:
				return createPos(int.min,int.min, int.min);
			}
			return begin;
		})
		.fold!((a, b) { 
			if (b.x != 0) {
				// Move forward
				int newAim = a.a + b.a;
				return createPos(a.x + b.x, a.d + newAim * b.x, newAim);
			} else {
				assert(b.d == 0, "Depth of b must be 0");
				return createPos(a.x, a.d, a.a + b.a); 
			}
		})( begin);
	return result.x * result.d;
}

mixin(makeDay!2);

// 57232 is invald

