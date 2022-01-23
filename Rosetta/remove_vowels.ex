--remove_vowels.ex

include ../library/char.e -- for 'char'
function out(char c)
    return not find(c,"aeiouAEIOU")
end function

writeln("**This app strips the vowels from the input string**\n")
constant str = "CANOE: CAN's Open Euphoria Libraries"
include ../library/io.e -- for 'writef', 'writefln'
writefln(str,"Input : '%s'.\n")
include ../library/sequence.e -- for 'filter_'
writefln(filter_(str,"out"),"Output : '%s'.\n")
