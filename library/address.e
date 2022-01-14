--------------------------------------------------------------------------------
-- address.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria address library
--* Version: 4.0.5.2
--* Author: C A Newbould
--* Date: 2022.01.12
--* Status: incomplete
--* Changes:
--** ##poke_## defined
--** ##copy## defined
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
    export function copy(address a, address b, integer i) -- f(addr -> addr -> i) -> addr
        mem_copy(a, b, i)
        return b
    end function
    export function free(address a) -- f(addr) -> v
        machine_proc(M_FREE, a)
        return VOID
    end function
    export enum SHORT, BYTE, DOUBLE, LONG, QUAD, POINTER
    export function poke_(address a, object o, integer typ = BYTE) -- f(addr -> o -> i) -> addr
        switch typ do
        case SHORT then poke2(a, o)
        case BYTE then poke(a, o)
        case DOUBLE then poke4(a, o)
        case LONG then poke_long(a, o)
        case QUAD then poke8(a, o)
        case POINTER then poke_pointer(a, o)
        end switch
        return a
    end function
--------------------------------------------------------------------------------
--/*
--    <eucode>global function poke(address a, object o) -- f(addr -> o) -> v</eucode>    
--*/
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--* Version: 4.0.5.1
--* Author: C A Newbould
--* Date: 2022.01.10
--* Status: incomplete
--* Changes:
--** created
--** ##free## defined
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
