import std.stdio;
import std.typecons : tuple;
import mir.combinatorics;
import std.parallelism: parallel;
import std.format;
import std.ascii : letters;
import std.conv  : to;

void main()
{
    int N=10, k1=5;
    auto p = combinations(N, k1);

    while( !p.empty) {
        auto v = p.front;
        p.popFront;
        auto k = permutations(v);
        foreach(a ; k)  {
            int[] narr ;
            foreach (val ; a) narr ~= val;
            NumberString ns = NumberString(narr);
            auto t = ns.numbers();
            bool test = t[0] * 4 == t[1];
            if (test) {
            writeln(write_solution(narr));
            }
        }
    }
}

string write_solution(int[] solution) {
    char[] c;
    c ~= "********\n";

    foreach (letter ; letters[0..5]) {
    c ~= format("%s ", letter);
    }
    c ~= "\n";

    foreach (numeral ; solution) {
        c ~= format("%s ", numeral);
    }

    return to!string(c);

}

struct NumberString {
    int[] symbols;
    int n1;
    int n2;

    this(int[] symbols) {
       int x = symbols[2] * 10^^3 + symbols[2] * 10^^2;
       n1 = symbols[0] * 10^^5 + symbols[1] * 10^^4 + x + symbols[3] * 10^^1 + symbols[4] * 10^^0;
       n2 = symbols[4] * 10^^5 + symbols[3] * 10^^4 + x + symbols[1] * 10^^1 + symbols[0] * 10^^0;
    }

    auto numbers() {
    return tuple(n1, n2);
    }
}