--------------------------------------------------------------------------------
-- Library: stdout.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria io support library
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.02.28
-- Status: complete
-- Changes:
--* created
--
--==Open Euphoria extension library: stdout for io
--
-- This library contains a single routine, which manages screen output.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
constant EOL = '\n', SCREEN = 1
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
function heading(sequence s)
    integer l = length(s)
    puts(SCREEN,repeat('-',l)&EOL) 
    puts(SCREEN,s&EOL)
    puts(SCREEN,repeat('-',l)&EOL&EOL)     
    return 0 
end function
--------------------------------------------------------------------------------
export function out(sequence txt, sequence ti)
    heading(ti)
    puts(SCREEN,txt)
    return getc(0) 
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
