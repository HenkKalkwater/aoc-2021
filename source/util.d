module util;

public import std.conv : to;

string readFile(int day)() {
	immutable string daystr = to!string(day);
	return import(daystr ~ ".txt");
}

string writeResult(string result)() {
	pragma(msg, "=====================");
	pragma(msg, "Compile-time result  ");
	pragma(msg, "=====================");
	pragma(msg, result);
	return result;
}

string makeDay(int day)() {
		string result = "immutable int inputNo=" ~ to!string(day) ~ ";";
		return result ~ q{
immutable string data = readFile!inputNo;
immutable string result = writeResult!(to!string(compute!data));

int main(string[] args) {
		import std.stdio : writeln;
		writeln("The result is:");
		writeln(result);
		return 0;
}
};
}
