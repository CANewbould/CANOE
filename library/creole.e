--------------------------------------------------------------------------------
-- creole.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria creole library
-- Version: 4.0.5.3
-- Author: C A Newbould
-- Date: 2022.01.26
-- Status: incomplete
-- Changes:
--* limited ##writef## to including line-feeds in format
--* extended ##write## to enable (double) line-feeds to be default action
--
--==Open Euphoria extension library: creole
--
-- This library contains tools to output to a webbrowser window from
-- CAN's Open Euphoria (CANOE).
--
-- The functions consist of three 'writing' functions for generating output
-- and one to "finish off", convert and display the user output
-- in a browser tab.
--
-- The writing functions:
--
--* ##write## is like ##puts## but without the channel number and with the option
--  to follow the value with a variable number of line-feeds
--* ##prnt## is essentially like ##print## without the channel number
--* ##writef## is like ##printf## but, again without the channel number, and,
--  also with the value before the format string. Moreover, the value doesn't
--  need the curly-brackets specified for strings in ##printf##.
--
-- The ##display## function does the necessary housekeeping before displaying
-- the output on a tab in the web-browser of your choice. If the default is not
-- available or to your liking, then add, as a string value, the name of the
-- browser you wish to use, as it is recognised by your current Operating System,
-- as the only argument of ##display##. For example "start" should work in MS
-- Windows provided file association has been set up.
--
-- The current default value is "IUP". This opens an IUP GUI WebBrowser inside 
-- a "plain" dialog, which, provided IUP is installed on the calling OS, will
-- display your results. The underlying dialog can be exited, using the //x//
-- when you have finished reading your results.
--
-- You can use ##creole## markup inside the writing functions to elaborate your
-- output. By using a suitable //css// setup, elaborate layouts can be developed
-- to add style to your results.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
constant CREOLE = open("test.cr", "w") -- the output stream
constant VOID = 0
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function write(object o="", integer x = 2) -- (o -> i) -> IO
    puts(CREOLE, o) puts(CREOLE, repeat('\n', x))
    return VOID
end function
--------------------------------------------------------------------------------
export function prnt(object o) -- (o) -> IO
    print(CREOLE, o) write("")
    return VOID
end function
--------------------------------------------------------------------------------
include string.e -- for 'string'
export function writef(object o, string f)-- (o -> [c]) -> IO
    printf(CREOLE, f, {o})
    return VOID
end function
--------------------------------------------------------------------------------
include iup.e as IUP
include iup.ew
include iupwb.ew as WB
export function display(string browser = "IUP") -- ([c]) -> IO
    close(CREOLE)
    system("creole test.cr", 0)
    -- Display results
    if equal(browser,"IUP") then
        IUP:Open()
        WB:Open()
            Ihandle wb = WebBrowser()
            setAttribute(wb,"EXPAND","YES")
            setAttribute(wb, "VALUE","file://" & machine_func(23) & "/test.html")
            dialog d = Dialog(wb)
            setAttribute(d,"TITLE","Creole-based ouput")
            setAttribute(d,"SIZE","500x300")
            show(d)
            mainLoop()
        return IUP:Close()
    else
        return system_exec(browser & " test.html", 0)
    end if
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version: 4.0.5.2
-- Author: C A Newbould
-- Date: 2022.01.11
-- Status: incomplete
-- Changes:
--* extended ##Display## to cover use of IUP
--* changed default in ##Display## to "IUP"
--------------------------------------------------------------------------------
-- Version: 4.0.5.1
-- Author: C A Newbould
-- Date: 2022.01.03
-- Status: incomplete
-- Changes:
--* copied from example
--* all routines made into functions
--* all scopes set to //export//
--* extended documentation
--------------------------------------------------------------------------------
