--------------------------------------------------------------------------------
-- address.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria address library
--* Version: 4.0.5.1
--* Author: C A Newbould
--* Date: 2022.01.10
--* Status: incomplete
--* Changes:
--** created
--** ##free## defined
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
constant M_ALLOC = 16, M_FREE = 17, NULL = 0, VOID = 0
--------------------------------------------------------------------------------
--/*
----
--*/
--------------------------------------------------------------------------------
export type address(atom a) -- t(a) -> addr
    return a > 0
    end type
    export function Address(atom a) -- f(a) -> addr
        if a > 0 then return machine_func(M_ALLOC, a)
        else return NULL
        end if
    end function
    export function free(address a) -- f(addr) -> v
        machine_proc(M_FREE, a)
        return VOID
    end function
--------------------------------------------------------------------------------
--/*
--    <eucode>global function poke(address a, object o) -- f(addr -> o) -> v</eucode>    
--*/
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--* Version: 4.0.5.0
--* Author: C A Newbould
--* Date: 2022.01.02
--* Status: incomplete
--* Changes:
--** created
--** **address** defined
--** ##Address## defined
--------------------------------------------------------------------------------
