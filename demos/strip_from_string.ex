--------------------------------------------------------------------------------
-- Test application: strip_from_string.ex
--------------------------------------------------------------------------------
--Version: 4.1.0.0
--Date: 2022.03.13
--Author: C A Newbould
--Status: Complete
--Changes:
--* copied from Rosetta Code solutions
--* modified output
--------------------------------------------------------------------------------
-- Define the filter function
--------------------------------------------------------------------------------
function out(integer i,sequence s)
    return not find(i,s)
end function
--------------------------------------------------------------------------------
include sequence.e -- for 'filter'
function stripchars(sequence s,sequence ex)
    return filter(s,"out",ex)
end function
constant originalString = "She was a soul stripper. She took my heart!"
--------------------------------------------------------------------------------
-- Determine output mode
--------------------------------------------------------------------------------
with define IUP
--------------------------------------------------------------------------------
-- Start the output
--------------------------------------------------------------------------------
include io.e -- for 'writeln'
writeln(originalString & " ->")
writeln(stripchars(originalString,"aei"))
--------------------------------------------------------------------------------
display("This CANOE app strips selected characters from a source string")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
