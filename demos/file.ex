--------------------------------------------------------------------------------
-- Test application: file.ex
--------------------------------------------------------------------------------
--Version: 4.1.0.1
--Date: 2022.03.11
--Author: C A Newbould
--Status: Complete
--Changes:
--* modified to use ##fread##
--* extended to check ##fseek## and use ##flines##
--* added use of ##fwhere## to ascertain length
--------------------------------------------------------------------------------
include file.e -- for 'File','flines','fread','fseek','fwhere'
--------------------------------------------------------------------------------
-- Carry out process: instantiation;read;length;rewind;read lines;close
--------------------------------------------------------------------------------
constant
    f = File("trim.ex","r")
    ,TEXT = fread(f)
    ,LENGTH = fwhere(f)
    ,REWIND = fseek(f,0)
    ,LINES = flines(f)
close(f)
--------------------------------------------------------------------------------
-- Determine output mode
--------------------------------------------------------------------------------
with define IUP
--------------------------------------------------------------------------------
-- Output result
--------------------------------------------------------------------------------
include io.e -- for 'display','writef','writefln','writeln'
writef(LENGTH,"The file has %d characters")
writefln(length(LINES)," and %d lines")
writeln("CONTENTS:")
writeln(TEXT)
display("Using the 'file' library functions to inspect the contents of 'trim.ex'")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--Version: 4.1.0.0
--Date: 2022.03.09
--Author: C A Newbould
--Status: Complete
--Changes:
--* created
--------------------------------------------------------------------------------
