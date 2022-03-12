--------------------------------------------------------------------------------
-- Library: libiup.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria IUP core library
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.02.28
-- Status: complete
-- Changes:
--* created
--
--==Open Euphoria extension library: libiup
--
-- This library contains a few core IUP wrappings.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include c2e.e
constant
    IUP = Clib("libiup.so")
    ,IOpen = Crid("IupOpen",IUP,{C_I,C_P},C_I)
    ,IClose = Crid("IupClose",IUP,{})
    ,ILoop = Crid("IupMainLoop",IUP,{})
    ,IDialog = Crid("IupDialog",IUP,{C_P},C_P)
    ,Iattrib = Crid("IupSetAttribute",IUP,{C_P,C_P,C_P})
    ,IText = Crid("IupText",IUP,{},C_P)
    ,Ishow = Crid("IupShow",IUP,{C_P},C_I)
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function Open()
    return c_func(IOpen,{0,0})
end function
--------------------------------------------------------------------------------
export procedure Close()
    c_proc(IClose)
end procedure
--------------------------------------------------------------------------------
export procedure Loop()
    c_proc(ILoop)
end procedure
--------------------------------------------------------------------------------
export function Dialog(atom a)
    return c_func(IDialog,{a})
end function
--------------------------------------------------------------------------------
export function show(atom a)
    return c_func(Ishow,{a})
end function
--------------------------------------------------------------------------------
export function Text()
    return c_func(IText)
end function
--------------------------------------------------------------------------------
include sequence.e
export procedure attrib(atom a,sequence s,sequence v)
    c_proc(Iattrib,{a,toC(s),toC(v)})
end procedure
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
