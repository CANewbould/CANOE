-- trim.ex

constant s = "\t\t   test   \t"
include ../library/string.e -- for 'trim'
include ../library/io.e -- for 'writefln', 'writeln'
writeln("This CANOE app tests the trim function")
writeln("--------------------------------------\n")
writefln(s,"original test with white space = '%s'")
writefln(trim(s,BEGINNING),"trim at beginning = '%s'")
writefln(trim(s,ENDING),"trim at the end = '%s'")
writefln(trim(s,BOTH),"trim both = '%s'")