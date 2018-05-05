
This is a brute-force solution to the 538 riddler from May 4, 2018. 

<https://fivethirtyeight.com/features/pirates-monkeys-and-coconuts-oh-my>

```
If A, B, C, D and E are all unique digits, what values would work with the following equation?

ABC,CDE × 4 = EDC,CBA
```

It relies on `mir-algorithm` for the combinatorics and so makes use of `dub`.

An example of running it:

```
$ cd dprojects/abcde

$ dub build --build=release
Performing "release" build using /usr/bin/dmd for x86_64.
itertools 1.1.0: building configuration "library"...
mir-algorithm 0.9.5: building configuration "library"...
mir-linux-kernel 1.0.0: building configuration "library"...
mir-random 0.4.5: building configuration "library"...
abcde ~master: building configuration "application"...
Linking...

$ ./abcde 
********
A B C D E 
2 1 9 7 8 
```