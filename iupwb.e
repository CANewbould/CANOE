--------------------------------------------------------------------------------
-- Library: iupwb.e
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
--==Open Euphoria extension library: iupwb for io
--
-- This library contains a basic IUP Dialog, within which is a webrowser object
-- used for displaying the output.
--
-- It has one routine only.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include libiup.e
include c2e.e
--------------------------------------------------------------------------------
atom html = open("test.html","w")
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
constant
    IUP_WB = Clib("libiupweb.so")
    ,WBO = Crid("+IupWebBrowserOpen", IUP_WB, {})
    ,WB = Crid("+IupWebBrowser", IUP_WB, {}, C_P)
export function out(sequence txt, sequence ti)
    puts(html,txt)
    close(html)
    if not Open() then
        c_proc(WBO)
        atom wb = c_func(WB)
        attrib(wb,"EXPAND","YES")
        attrib(wb,"VALUE","file://" & machine_func(23) & "/test.html")
        atom d = Dialog(wb)
        attrib(d,"SIZE","500x300")
        attrib(d,"TITLE",ti)
        show(d)
        Loop()
        Close()
    end if
    return 1
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
