--------------------------------------------------------------------------------
--	Library: crid.e
--------------------------------------------------------------------------------
-- Notes:
--
--
--------------------------------------------------------------------------------
--/*
--= Library: crid.e
-- Description: a library to handle C-language functions in OE.
------
--[[[Version: 4.0.5.0
--Euphoria Versions: 4.0.5 upwards
--Author: C A Newbould
--Date: 2022.01.01
--Status: incomplete; operational
--Changes:]]]
--* created
--* **crid** defined
--* ##Crid## defined
--* ##fC## defined
--* ##vfC## defined
--
--==Open Euphoria extension library: crid
--
-- This library hold all the functionality for executing C-language
-- functions.
--
-- Utilise this support by adding the following statement to the calling
-- module:
-- <eucode>include crid.e</eucode>
------
--*/
--------------------------------------------------------------------------------
--/*
--==Interface
--*/
--------------------------------------------------------------------------------
--/*
--=== Includes
--*/
--------------------------------------------------------------------------------
include clib.e -- for 'clib'
include ints.e -- for 'ints'
include string.e -- for 'string'
--------------------------------------------------------------------------------
--/*
--=== crid type
--*/
--------------------------------------------------------------------------------
export constant C_I = #01000004, C_P = #03000001
constant M_DEFINE_C = 51, VOID = 0
export constant NULL = 0
export type crid(integer f) -- (i) ->cr
    return f > -2
    end type
    export function Crid(string name, clib lib, ints cargs = {}, integer cret = VOID) --  ([c] -> cl -> [i] -> i) -> cr
        return machine_func(M_DEFINE_C, {lib, name, cargs, cret})
        end function
    export function fC(crid fn, ints eargs = {}) -- (cr -> [i]) -> i
        return c_func(fn, eargs)
        end function
    export function vfC(crid fn, ints eargs = {}) -- (cr -> [i]) -> void
        c_proc(fn, eargs)
        return VOID
        end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
