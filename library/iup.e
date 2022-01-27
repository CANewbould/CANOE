--------------------------------------------------------------------------------
--	Library: iup.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: iup.e
-- Description: a library to interface the IUP GUI with OE.
------
--[[[Version: 4.0.5.7
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.26
--Status: complete; operational
--Changes:]]]
--* ##ExitLoop## defined
--* modified documentation
--* modified to operate on **iup**
--* moved event-handling to //iup.ew//
--
--==OE library: iup
--
-- This library hold all the functionality for accessing, opening, closing
-- and running the IUP ##system## in OE.
--
-- The library also contains those IUP functions which are "free-standing", so
-- do not rely on the existence of any top-level window.
--
-- Utilise this support by adding the following statement to the calling
-- module:
-- <eucode>include iup.e</eucode>
--*/
--------------------------------------------------------------------------------
--/*
--==Interface
--*/
--------------------------------------------------------------------------------
--/*
--=== IUP core
--*/
--------------------------------------------------------------------------------
include clib.e -- for 'Clib'
include crid.e -- for 'crid', 'Crid', 'fC', 'vfC'
--------------------------------------------------------------------------------
--/*
--<eucode>type iup</eucode>
--*/
--------------------------------------------------------------------------------
type iup(atom a) -- t(a -> t(cl)) -> iup - extends clib
    return clib(a)
end type
    export function Close(iup this=IUP) -- f(iup) -> v
        crid CLOSE = Crid("+IupClose", this)
        return vfC(CLOSE)
        end function
    export function Open(iup this=IUP) -- f(iup) -> i
        crid OPEN = Crid("+IupOpen", this, {C_I, C_P}, C_I)
        return fC(OPEN, {NULL, NULL})
        end function
    export function Version(iup this=IUP) -- f(iup) -> a
        crid VERNO = Crid("+IupVersionNumber", this,,C_I)
        return fC(VERNO)/100000
        end function
--------------------------------------------------------------------------------
ifdef WINDOWS then
    constant LIB = "iup.so"
elsifdef LINUX then
    constant LIB = "libiup.so"
end ifdef
--------------------------------------------------------------------------------
export constant IUP = Clib(LIB)
--------------------------------------------------------------------------------
--/*
--=== IUP predefined dialogs
--*/
--------------------------------------------------------------------------------
include string.e -- for 'string', 's2c'
constant C_S = C_P
export function Alarm(string message, string title, string b1, string b2="",string b3="", iup this=IUP) -- F([c]->[c]->[c]->[c]->[c]) -> i
    crid A = Crid("+IupAlarm", this, {C_S, C_S, C_S, C_S, C_S}, C_I)
    sequence eargs = {s2c(title), s2c(message), s2c(b1)} & repeat(0, 2)
    if length(b2) then eargs[4] = s2c(b2)
        if length(b3) then eargs[5] = s2c(b3) end if
    end if
    return fC(A, eargs)
    end function
export function Message(string message, string title, iup this=IUP) -- f([c] -> [c]) -> v
    crid M = Crid("+IupMessage", this, {C_S, C_S})
    return vfC(M, {s2c(title), s2c(message)})
    end function
    include address.e -- for 'address', 'Address', 'free'
export function GetFile(string filename, integer maxsize = 4096, iup this=IUP) -- f([c] -> i) -> [i,[c]]
    crid GF = Crid("+IupGetFile", this, {C_S, C_I}, C_I)
    address m = s2c(filename,maxsize)
    integer ret = fC(GF,{m,maxsize})
    string st = peek_string(m)
    free(m)
    return {ret,st}
    end function
export function GetText(string text, string title, integer maxsize = 10240, iup this=IUP) -- f([c] -> [c] -> i) -> [i,[c]]
    crid GT = Crid("+IupGetText", this, {C_S, C_S, C_I}, C_I)
    address m = s2c(text,maxsize)
    integer ret = fC(GT,{s2c(title),m,maxsize})
    string st = peek_string(m)
    free(m)
    return {ret,st}
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.6
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.25
--Status: complete; operational
--Changes:]]]
--* ##Alarm## defined
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.5
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.23
--Status: complete; operational
--Changes:]]]
--* re-cast based on an **clib** type but using default to IUP
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.4
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.23
--Status: complete; operational
--Changes:]]]
--* re-cast in more standard CANOE form
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.3
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.11
--Status: complete; operational
--Changes:]]]
--------------------------------------------------------------------------------
--* ##GetFile## defined
--[[[Version: 4.0.5.2
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.10
--Status: complete; operational
--Changes:]]]
--* ##GetText## defined
--------------------------------------------------------------------------------
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.02
--Status: complete; operational
--Changes:]]]
--------------------------------------------------------------------------------
--* ##Message## defined
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.01
--Status: complete; operational
--Changes:]]]
--* created
--* ##Close## defined
--* ##Open## defined
--* ##Version## defined
--* ##MainLoop## defined
--------------------------------------------------------------------------------
