--------------------------------------------------------------------------------
-- address.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria address library
--* Version: 4.0.5.0
--* Author: C A Newbould
--* Date: 2022.01.02
--* Status: incomplete
--* Changes:
--** created
--** **address** defined
--** ##Address## defined
--
--==Open Euphoria extension library: address
--This library contains tools that apply to the **address*
--type of Open Euphoria, as defined here.
--
-- An **address** is a pointer to a slot of memory.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
constant M_ALLOC = 16, NULL = 0
--------------------------------------------------------------------------------
--/*
----
--*/
--------------------------------------------------------------------------------
export type address(atom a) -- (a) -> addr
    return a > 0
    end type
    export function Address(atom a) -- (a) -> addr
        if a > 0 then return machine_func(M_ALLOC, a)
        else return NULL
        end if
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
