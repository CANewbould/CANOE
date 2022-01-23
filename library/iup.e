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
--[[[Version: 4.0.5.4
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.23
--Status: complete; operational
--Changes:]]]
--* re-cast in more standard CANOE form
--
--==OE library: iup
--
-- This library hold all the functionality for accessing, opening, closing
-- and running IUP in OE.
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
ifdef WINDOWS then
    constant LIB = "iup.so"
elsifdef LINUX then
    constant LIB = "libiup.so"
end ifdef
include clib.e -- for 'Clib'
export constant IUP = Clib(LIB)
    include crid.e -- for 'crid', 'Crid', 'fC', 'vfC'
    export function Close() -- f() -> v
        crid CLOSE = Crid("+IupClose", IUP)
        return vfC(CLOSE)
        end function
    export function Open() -- f() -> i
        crid OPEN = Crid("+IupOpen", IUP, {C_I, C_P}, C_I)
        return fC(OPEN, {NULL, NULL})
        end function
    export function MainLoop() -- f() -> v
        crid ML = Crid("+IupMainLoop", IUP)
        return vfC(ML)
        end function
    export function Version() -- f() -> a
        crid VERNO = Crid("+IupVersionNumber", IUP,,C_I)
        return fC(VERNO)/100000
        end function
--------------------------------------------------------------------------------
--/*
--=== IUP dialogs
--*/
--------------------------------------------------------------------------------
include string.e -- for 'string', 's2c'
constant C_S = C_P
export function Message(string message, string title) -- f([c] -> [c]) -> v
    crid M = Crid("+IupMessage", IUP, {C_S, C_S})
    return vfC(M, {s2c(title), s2c(message)})
    end function
    include address.e -- for 'address', 'Address', 'free'
export function GetFile(string filename, integer maxsize = 4096) -- f([c] -> i) -> [i,[c]]
    crid GF = Crid("+IupGetFile", IUP, {C_S, C_I}, C_I)
    address m = s2c(filename,maxsize)
    integer ret = fC(GF,{m,maxsize})
    string st = peek_string(m)
    free(m) 
    return {ret,st}
    end function
export function GetText(string text, string title, integer maxsize = 10240) -- f([c] -> [c] -> i) -> [i,[c]]
    crid GT = Crid("+IupGetText", IUP, {C_S, C_S, C_I}, C_I)
    address m = s2c(text,maxsize)
    integer ret = fC(GT,{s2c(title),m,maxsize})
    string st = peek_string(m)
    free(m) 
    return {ret,st}
    end function
--------------------------------------------------------------------------------
-- Previous versions
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
