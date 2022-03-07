--------------------------------------------------------------------------------
-- Library: iup.e
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
--==Open Euphoria extension library: iup for io
--
-- This library contains a basic IUP Dialog, within which is a non-editable
-- text used for displaying the output.
--
-- It has one routine only.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include libiup.e
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function out(sequence txt, sequence ti)
    if not Open() then
        atom t = Text()
        attrib(t, "VALUE", txt)
        attrib(t, "MULTILINE", "YES")
        attrib(t, "EXPAND", "YES")
        attrib(t, "READONLY", "YES")
        attrib(t, "FONT", "monospace, 14")
        atom d = Dialog(t)
        attrib(d, "SIZE","500x300")
        attrib(d, "TITLE", ti)
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
