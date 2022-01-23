-- strip_from_string.ex

include ../library/io.e -- for 'writeln'
writeln("This CANOE app strips selected characters from a source string")
writeln("--------------------------------------------------------------") writeln()

include ../library/string.e -- for 'string'
include ../library/sequence.e -- for 'filter','in'    
function out(integer i,string s)
    return not in(s,i)
end function
function stripchars(string s,string ex)
    return filter(s,"out",ex)
end function
constant originalString = "She was a soul stripper. She took my heart!"
writeln(originalString & " ->")
writeln(stripchars(originalString,"aei"))