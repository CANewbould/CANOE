--------------------------------------------------------------------------------
-- Library: libui.e
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
--==Open Euphoria extension library: libui for io
--
-- This library contains a basic libui window, within which is a label object
-- used for displaying the output.
--
-- It has two routines:
--* one to display the window
--* another to dispose of it
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include ui.e
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function out(sequence txt, sequence ti)
    initCheck()
    atom t = uiNewLabel(txt)
    atom box = uiNewVerticalBox()
    uiBoxAppend(box, t, 0)
    atom d = uiNewWindow(ti, 200, 100, 0)
    uiWindowOnClosing(d, "onClosing")
    uiWindowSetChild(d, box)
    uiControlShow(d)
    uiMain()
    return 0
end function
--------------------------------------------------------------------------------
function onClosing(atom w, atom data)
    uiControlDestroy(w)
    uiQuit()
    return 0
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
