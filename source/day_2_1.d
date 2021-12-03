import util;

import std.algorithm;
import std.format;
import std.string;
import std.typecons;

struct Pos {
	int x;
	int d;
}

Pos createPos(int x, int d) {
	return Pos(x,d);
}


int compute(string input)() {

	Pos begin = createPos(0,0);

	Pos result = input.lineSplitter
		.map!((line) {
				string cmd;
				int amount;
				assert(line.formattedRead!"%s %d"(cmd, amount) == 2);

				switch(cmd) {
				case "forward":
					return createPos(amount,0);
				case "down":
					return createPos(0,amount);
				case "up":
					return createPos(0,-amount);
				default:
					return createPos(int.min,int.min);
				}
				return begin;
			})
		.fold!((a, b) { 
					return createPos(a.x + b.x, a.d + b.d); 
				})( begin);
	return result.x * result.d;
}

mixin(makeDay!2);

// 57232 is invald

