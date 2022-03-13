--------------------------------------------------------------------------------
-- Library: libiup.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria IUP core library
-- Version: 4.1.0.2
-- Author: C A Newbould
-- Date: 2022.03.13
-- Status: complete
-- Changes:
--* defined ##Label##
--* defined ##Button##
--* defined ##Fill##
--* defined ##New##
--* defined ##Hbox##
--* defined ##Vbox##
--* defined ##setCallback##
--* defined ##Icallback##
--* added constants
--* made ##Close## return sensible value
--
--==Open Euphoria extension library: libiup
--
-- This library contains a few core IUP wrappings.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include c2e.e -- for 'Clib','Crid'
constant
    IUP = Clib("libiup.so")
    ,IOpen = Crid("IupOpen",IUP,{C_I,C_P},C_I)
    ,IClose = Crid("IupClose",IUP,{})
    ,ILoop = Crid("IupMainLoop",IUP,{},C_I)
    ,IDialog = Crid("IupDialog",IUP,{C_P},C_P)
    ,Iattrib = Crid("IupSetAttribute",IUP,{C_P,C_P,C_P})
    ,INew = Crid("IupSetAttributes",IUP,{C_P,C_P},C_P)
    ,IFill = Crid("IupFill",IUP,{},C_P)
    ,IButton = Crid("IupButton",IUP,{C_P,C_P},C_P)
    ,ILabel = Crid("IupLabel",IUP,{C_P},C_P)
    ,IText = Crid("IupText",IUP,{},C_P)
    ,Ishow = Crid("IupShow",IUP,{C_P},C_I)
    ,Igetattrib = Crid("IupGetAttribute",IUP,{C_P,C_P},C_P)
    ,Isetcallback = Crid("IupSetCallback",IUP,{C_P, C_P, C_I}, C_I)
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function Open()
    return c_func(IOpen,{0,0})
end function
--------------------------------------------------------------------------------
export function Close()
    c_proc(IClose)
    return IUP_CLOSE
end function
--------------------------------------------------------------------------------
export function Loop()
    return c_func(ILoop)
end function
--------------------------------------------------------------------------------
export function Dialog(atom a)
    return c_func(IDialog,{a})
end function
--------------------------------------------------------------------------------
export function show(atom a)
    return c_func(Ishow,{a})
end function
--------------------------------------------------------------------------------
export function Hbox(sequence s)
    s &= 0
    sequence c = repeat(C_P, length(s))
    return c_func(Crid("IupHbox",IUP,c,C_P),s)
end function
--------------------------------------------------------------------------------
export function Vbox(sequence s)
    s &= 0
    sequence c = repeat(C_P, length(s))
    return c_func(Crid("IupVbox",IUP,c,C_P),s)
end function
--------------------------------------------------------------------------------
export function Fill()
    return c_func(IFill)
end function
--------------------------------------------------------------------------------
export function Button(sequence s)
    return c_func(IButton,{toC(s),0})
end function
--------------------------------------------------------------------------------
export function Label(sequence s)
    return c_func(ILabel,{toC(s)})
end function
--------------------------------------------------------------------------------
export function Text()
    return c_func(IText)
end function
--------------------------------------------------------------------------------
export function New(atom a,sequence s)
    return c_func(INew,{a,toC(s)})
end function
--------------------------------------------------------------------------------
include sequence.e -- for 'toC'
export procedure attrib(atom a,sequence s,sequence v)
    c_proc(Iattrib,{a,toC(s),toC(v)})
end procedure
export function getattrib(atom a,sequence s)
    return peek_string(c_func(Igetattrib,{a,toC(s)}))
end function
--------------------------------------------------------------------------------
export function setcallback(atom a,sequence s, atom r)
    return c_func(Isetcallback,{a,toC(s),r})
end function
export function Icallback(sequence name, atom rid = routine_id(name))
    return machine_func(52,{'+', rid})
end function
--------------------------------------------------------------------------------
export enum IUP_CONTINUE = -4, IUP_CLOSE, IUP_DEFAULT, IUP_IGNORE
export enum IUP_OPENED = -1, IUP_NOERROR, IUP_ERROR
export constant IUP_INVALID = -1
export constant IUP_INVALID_ID = -10
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version: 4.1.0.1
-- Author: C A Newbould
-- Date: 2022.03.12
-- Status: complete
-- Changes:
--* defined ##getattrib##
--------------------------------------------------------------------------------
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.02.28
-- Status: complete
-- Changes:
--* created
--------------------------------------------------------------------------------
