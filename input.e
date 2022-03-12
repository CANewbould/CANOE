--------------------------------------------------------------------------------
-- Library: input.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria io GUI input function
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.03.12
-- Status: complete
-- Changes:
--* created
--
--==Open Euphoria extension library: input for io
--
-- This library contains a constrained IUP pre-defined dialog to obtain a
-- response from the user via a GUI means.
--
-- It has one routine only.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include libiup.e
include sequence.e
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function input(sequence title)
    sequence s = ""
    if not Open() then
        atom t = Text()
        attrib(t, "MULTILINE", "NO")
        attrib(t,"EXPAND","YES")
        attrib(t, "FONT", "monospace, 10")
        atom d = Dialog(t)
        attrib(d, "SIZE","150x40")
        attrib(d, "TITLE", title)
        show(d)
        Loop()
        s = getattrib(t,"VALUE")
        Close()
    end if
    return s
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
