--------------------------------------------------------------------------------
-- html.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria html library
-- Version: 4.0.5.3
-- Author: C A Newbould
-- Date: 2022.01.26
-- Status: incomplete
-- Changes:
--* modified to reflect changes in //iup.ew//
--
--==Open Euphoria extension library: html
--
-- This library contains tools to output to a webbrowser from
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
--  need the curly-brackets specified for strings in ##printf##
--
-- The ##display## function does the necessary housekeeping before displaying
-- the output on a tab in the web-browser of your choice. If the default is not
-- available or to your liking, then add, as a string value, the name of the
-- browser you wish to use, as it is recognised by your Operating System,
-- as the only argument of ##display##.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
constant HTML = open("test.html", "w") -- the output stream
constant VOID = 0
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function write(object o, integer x = 1) -- (o -> i) -> IO
    puts(HTML, o) puts(HTML, repeat('\n', x))
    return VOID
end function
--------------------------------------------------------------------------------
export function prnt(object o) -- (o) -> IO
    print(HTML, o) write("")
    return VOID
end function
--------------------------------------------------------------------------------
include string.e -- for 'string'
export function writef(object o, string f) -- (o -> [c]) -> IO
    printf(HTML, f & "\n\n", {o})
    return VOID
end function
--------------------------------------------------------------------------------
include iup.e as IUP
include iup.ew
include iupwb.ew as WB
export function display(string browser = "firefox") -- ([c]) -> IO
    close(HTML)
    -- Display results
    if equal(browser,"IUP") then
        IUP:Open()
        WB:Open()
            Ihandle wb = WebBrowser()
            setAttribute(wb,"EXPAND","YES")
            setAttribute(wb, "VALUE","file://" & machine_func(23) & "/test.html")
            dialog d = Dialog(wb)
            setAttribute(d,"TITLE","HTML-based ouput")
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
-- Date: 2022.01.15
-- Status: incomplete
-- Changes:
--* changed ##display## to accept //IUP//
--------------------------------------------------------------------------------
-- Version: 4.0.5.1
-- Author: C A Newbould
-- Date: 2022.01.03
-- Status: incomplete
-- Changes:
--* copied from creole
--* all routines made into functions
--* all scopes set to //export//
--* extended documentation
--------------------------------------------------------------------------------
