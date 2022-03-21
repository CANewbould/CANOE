--------------------------------------------------------------------------------
-- Library: c2e.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria C-language management library
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.03.11
-- Status: complete
-- Changes:
--* created
--
--==Open Euphoria extension library: file
--
-- This library contains material for accessing files.
--
--==Interface
--
--===Includes
--*/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--/*
--===Type: clib
--*/
--------------------------------------------------------------------------------
export type clib(atom c)
    return c>=0
    end type
    export function Clib(sequence libs) --[[c]]->clib
        return machine_func(50,libs)
    end function
--------------------------------------------------------------------------------
--/*
--===Type: crid
--*/
--------------------------------------------------------------------------------
export type crid(integer f) -- (i) ->cr
    return f > -2
    end type
    constant VOID = 0
    export function Crid(sequence name, clib lib, sequence cargs = {}, integer cret = VOID) --  ([c] -> cl -> [i] -> i) -> cr
        return machine_func(51, {lib, name, cargs, cret})
    end function
--------------------------------------------------------------------------------
export constant C_I = #01000004, C_P = #03000001
export constant NULL = 0
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
