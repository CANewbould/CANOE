--------------------------------------------------------------------------------
-- char.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria char library
-- Version: 4.0.5.1
-- Author: C A Newbould
-- Date: 2022.01.19
-- Status: incomplete
-- Changes:
--* **char** definition extended
--
--==Open Euphoria extension library: char
--This library contains tools that apply to the
--**char** type of Open Euphoria, as defined here.
--
-- A **char** is a single-value (**integer**) value which is an /ascii/
-- printable character.
--
--==Interface
--*/
--------------------------------------------------------------------------------
include ints.e -- for 'Ints'
--------------------------------------------------------------------------------
export type char(integer c) --> t(i) -> c
    return find(c, Ints(' ', '~') & Ints(9,13))
    end type
    export function lower(char this) -- f(c) -> c
        if find(this, Ints('A', 'Z')) then return this + 32
        else return this
        end if
    end function
    export function s2(char x, integer y) -- f(c -> i) -> i
        return (x-48) + 10*y
    end function
    export function upper(char this) -- f(c) -> c
        if find(this, Ints('a', 'z')) then return this - 32
        else return this
        end if
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version: 4.0.5.0
-- Author: C A Newbould
-- Date: 2022.01.02
-- Status: incomplete
-- Changes:
--* created
--------------------------------------------------------------------------------
