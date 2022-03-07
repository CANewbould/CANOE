--------------------------------------------------------------------------------
-- Library: io.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria io library
-- Version: 4.1.0.1
-- Author: C A Newbould
-- Date: 2022.03.02
-- Status: complete
-- Changes:
--* ##writel## extended
--
--==Open Euphoria extension library: io
--
-- This library contains tools to output to a variety of sources.
--
-- The functions consist of five 'writing' functions for generating output
-- and one to "finish off", convert and display the user output
-- in their chosen output environment.
--
-- The writing functions:
--
--* ##write## is like ##puts## but without the channel number
--* ##writeln## adds an end-of-line to ##write##
--* ##writef## is like ##printf## but, again without the channel number, and,
--  also with the value before the format string. Moreover, the value doesn't
--  need the curly-brackets specified for strings in ##printf##
--* ##writefln## adds an end-of-line to ##writef##
--* ##writel## offers a 'pretty-print' form of output for lists
--
-- The ##display## function is the mechanism for displaying
-- the output in the desired output medium. At present the following options
-- are available:
--
--* STDOUT - the default
--* IUP - displays the output in a non-editable text-on-dialog
--* UI - uses //libui// instead of //iup//
--* IUPWB - uses an IUP webbrowser tab to display the results - here html
--  markup can be used
--* GTK - uses //euGTK// for output - limited markup is also possible
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
constant EOL = '\n', VOID = 0
--------------------------------------------------------------------------------
-- The local storage
--------------------------------------------------------------------------------
sequence output = ""
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function write(object o)
    output &= o
    return VOID
end function
--------------------------------------------------------------------------------
export function writeln(object o)
    return write(o&EOL)
end function
--------------------------------------------------------------------------------
export function writef(object o, sequence fmt)
    output &= sprintf(fmt,{o})
    return VOID
end function
--------------------------------------------------------------------------------
export function writefln(object o, sequence fmt)
    return writef(o,fmt&EOL)
end function
--------------------------------------------------------------------------------
export function writel(sequence l,sequence fmt="%d") -- ([i]) -> IO
    output &= sprintf("{"&fmt, l[1])
    for i = 2 to length(l) do
        output &= sprintf(","&fmt, l[i])
    end for
    output &= '}'
    return VOID
end function
--------------------------------------------------------------------------------
-- output options
--------------------------------------------------------------------------------
ifdef IUP then
    include iup.e as SOURCE
elsifdef IUPWB then
    include iupwb.e as SOURCE
elsifdef UI then
    include libui.e as SOURCE
elsifdef GTK then
    include gtk.e as SOURCE
elsedef
    include stdout.e as SOURCE
end ifdef
--------------------------------------------------------------------------------
export function display(sequence title="")
    SOURCE:out(output,title)
    return VOID
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.02.28
-- Status: complete
-- Changes:
--* created
--------------------------------------------------------------------------------
