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
--[[[Version: 4.0.5.1
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.02
--Status: complete; operational
--Changes:]]]
--* ##Message## defined
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
--
--=== Includes
--
--------------------------------------------------------------------------------
include clib.e -- for 'Clib'
include crid.e -- for 'crid', 'Crid', 'fC', 'vfC'
--------------------------------------------------------------------------------
include string.e -- for 'string', 's2c'
--------------------------------------------------------------------------------
constant C_S = C_P
export function Message(string message, string title) -- ([c] -> [c]) -> v
    crid M = Crid("+IupMessage", IUP, {C_S, C_S})
    return vfC(M, {s2c(title), s2c(message)})
end function
--------------------------------------------------------------------------------
--/*
--=== IUP core
--*/
--------------------------------------------------------------------------------
constant LIB = "libiup.so"
export constant IUP = Clib(LIB)
export function Close() -- () -> v
    crid CLOSE = Crid("+IupClose", IUP)
    return vfC(CLOSE)
    end function
export function Open() -- () -> i
    crid OPEN = Crid("+IupOpen", IUP, {C_I, C_P}, C_I)
    return fC(OPEN, {NULL, NULL})
    end function
export function MainLoop() -- () -> v
    crid ML = Crid("+IupMainLoop", IUP)
    return vfC(ML)
    end function
export function Version() -- () -> a
    crid VERNO = Crid("+IupVersionNumber", IUP,,C_I)
    return fC(VERNO)/100000
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
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
