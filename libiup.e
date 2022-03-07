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
include std/dll.e
constant
    IUP = open_dll("libiup.so")
    ,IOpen = define_c_func(IUP,"IupOpen",{C_INT,C_POINTER},C_INT)
    ,IClose = define_c_proc(IUP,"IupClose",{})
    ,ILoop = define_c_proc(IUP,"IupMainLoop",{})
    ,IDialog = define_c_func(IUP,"IupDialog",{C_POINTER},C_POINTER)
    ,Iattrib = define_c_proc(IUP,"IupSetAttribute",{C_POINTER,C_POINTER,C_POINTER})
    ,IText = define_c_func(IUP,"IupText",{},C_POINTER)
    ,Ishow = define_c_func(IUP,"IupShow",{C_POINTER},C_INT)
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
