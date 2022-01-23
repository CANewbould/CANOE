-- integer_comparison.ex

-- CANOE uses 'export' throughout
include ../library/io.e -- for write, writeln
include ../library/sequence.e -- for init
include ../library/string.e -- for s2i

-- Input:
--* Prompt for number, as string
--* read from console
--* remove trailing lf
--* convert to integer
write("First number 'a' = ") integer a = s2i(init(gets(0)))
write("Second number 'b' = ") integer b = s2i(init(gets(0)))
 
-- Output
--* use formatted value
--* threeway test but prefer to have an explicit else
writef(a,"%d is ")
if a < b then write("less than")
elsif a = b then write("equal to")
else write("greater then")
end if
writefln(b," %d")
