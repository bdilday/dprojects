
import std.stdio;
import std.range;
import std.algorithm.comparison : equal;
import std.getopt;
import core.stdc.stdlib : exit;


void main(string[] args) {
	ulong piratebooty, monkeynut, initnut, seqlength;
	try {
		auto parseargs = getopt(
			args,
			std.getopt.config.required,
			"piratebooty", "how many piles the pirates make", &piratebooty,
			std.getopt.config.required,   
			"monkeynut", "how many coconut the monkeys get", &monkeynut,
			std.getopt.config.required,  
			"seqlength", "how many pirates",&seqlength,
			std.getopt.config.required,  
			"initnut", "number of coconuts on the last morning", &initnut
			);

		if (parseargs.helpWanted)
		{
			defaultGetoptPrinter("Some information about the program.",
				parseargs.options);
 	     	exit(0);
 	     }

 	     auto seq = recurrence!((a, n) => a[n-1] * piratebooty + monkeynut)(initnut);
 	     	int i = -1;
 	     	foreach( u ; seq.take(seqlength)) {
 	     		writefln("iter: %4d nuts: %d", ++i, u);
 	     	} 	     
 	  
 	 } 

 	 catch (Exception exc)
 	 {
 	 	stderr.writefln("Error processing command line arguments: %s", exc.msg);
 	 	stderr.writeln("Use the --help flag for help on the command line arguments");
 	 	exit(1);
 	 }
 }

