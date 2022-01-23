--string_length.ex

puts(1, "Determining sequence length\n")
puts(1,"----------------------------\n\n")
puts(1,"'length' is built into Euphoria, as the number of bytes.\nIt applies to all objects, thus:\n\n")

printf(1,"length(12.78) -> %d\n",length(12.78))
printf(1,"length(\"I am a string\") -> %d\n",length("I am a string"))
printf(1,"length({{1,2},3,{4,5,6},\"hello\"}) -> %d\n",length({{1,2},3,{4,5,6},"hello"}))

include ../library/sequence.e -- for 'fold'
writeln() writeln("but could be defined, in CANOE style as 'length_':") writeln()
function count(object o,integer i) -- f(o->i) -> i
    return i+1
end function
function length_(object o) -- f(o) -> i
    if atom(o) then return 1
    else return fold(o,"count",0)    
    end if
end function

include ../library/io.e -- for 'writefln'
writefln(length_(12.78),"length_(12.78) -> %d")
writefln(length_("I am a string"),"length_(\"I am a string\") -> %d")
writefln(length_({{1,2},3,{4,5,6},"hello"}),"length_({{1,2},3,{4,5,6},\"hello\"}) -> %d")

constant s = "𝔘𝔫𝔦𝔠𝔬𝔡𝔢"
writeln()
writeln("Note that Euphoria doesn't currently handle unicode:")
writefln(length_(s),"length_(s), where s is 7 unicode characters, -> %d")
constant s2 = "\uD834\uDD2A"
writefln(length_(s2),"length_(s2), where s is a single unicode character, -> %d")
