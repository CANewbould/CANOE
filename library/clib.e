--------------------------------------------------------------------------------
--	Library: clib.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: <functional-euphoria>clib.e
-- Description: a library to handle C-language libraries in OE.
------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.01
--Status: complete; operational
--Changes:]]]
--* created
--* **clib** defined
--* ##Clib## defined
--
--==Open Euphoria extension library: clib
--
-- This library hold all the functionality for accessing the content
-- of a C-language library in FPOE.
--
-- Utilise this support by adding the following statement to the calling
-- module:
-- <eucode>include clib.e</eucode>
------
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
--------------------------------------------------------------------------------
--/*
--=== clib type
--*/
--------------------------------------------------------------------------------
export type clib(atom c) -- t(a) -> cl
    return c > 0
    end type
    constant M_OPEN_DLL = 50
    export function Clib(sequence libs) -- f([[c]]) -> cl
        return machine_func(M_OPEN_DLL, libs)
        end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
