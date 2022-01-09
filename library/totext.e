--------------------------------------------------------------------------------
-- totext.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria output library
-- Version: 4.0.5.0
-- Author: C A Newbould
-- Date: 2022.01.03
-- Status: incomplete
-- Changes:
--* copied from //creole.e//
--* modified
--
--==Open Euphoria extension library: output
--
-- This library contains tools to output to a string store from
-- CAN's Open Euphoria (CANOE). The intention is to enable this store to be
-- displayed in an IUP Dialog, rather than to a Terminal Window.
--
-- The functions consist of three 'writing' functions for generating output
-- and one to "finish off", by displaying the user output in a dialog.
--
-- The writing functions:
--
--* ##write## is like ##puts## but without the channel number and with the option
--  to follow the value with a variable number of line-feeds
--* ##writef## is like ##printf## but, again without the channel number, and,
--  also with the value before the format string. Moreover, the value doesn't
--  need the curly-brackets specified for strings in ##printf##
--* ##writel## handles the display of the **ints** type in a "pretty" format
--
-- The ##display## function does the necessary housekeeping before displaying
-- the output in a suitably-formatted modal dialog. Here you can set the title
-- of the dialog.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include string.e -- for 'string'
string txt = {} -- the output string
constant VOID = 0
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function write(string s, integer x = 1) -- ([c] -> i) -> IO
    txt &= s & repeat('\n', x)
    return VOID
end function
--------------------------------------------------------------------------------
export function writef(object o, string f) -- (o -> [c]) -> IO
    txt &= sprintf(f, {o})
    return VOID
end function
--------------------------------------------------------------------------------
include ints.e -- for 'ints'
include sequence.e -- for 'last'
export function writel(ints l) -- ([i]) -> IO
    string o = sprintf("{%d", head_(l))
    for i = 2 to length(l) do -- over 'tail': fold(tail(l), writef_, o) writef_(o,s) from sprintf(",%d",o)
        o &= sprintf(",%d", l[i])
    end for
    o &= '}'
    write(o)
    return VOID
end function
--------------------------------------------------------------------------------
include iup.e -- for IUP engine
include iup.ew -- for IUP widgets
export function display(string title) -- ([c]) -> IO
    Open()
        Ihandle t = Text()
        SetAttribute(t, "VALUE", txt)
        SetAttribute(t, "MULTILINE", "YES")
        SetAttribute(t, "EXPAND", "YES")
        SetAttribute(t, "READONLY", "YES")
        SetAttribute(t, "FONT", "Arial, 14")
        Ihandle d = Dialog(t)
        SetAttribute(d, "SIZE", "HALFxHALF")
        SetAttribute(d, "TITLE", title)
        Show(d)
    MainLoop()
    Close()
    return VOID
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
