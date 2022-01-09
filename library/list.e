--------------------------------------------------------------------------------
-- list.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria list library
-- Version: 4.0.5.0
-- Author: C A Newbould
-- Date: 2022.01.02
-- Status: incomplete
-- Changes:
--* created
--* **list** defined
--* ##sum## defined
--* ##product## defined
--
--==Open Euphoria extension library: list
-- This library contains tools that apply to the
-- **list** type defined here.
--
-- A **list** is a specialised **sequence**, where all the elements are
-- of the same type. Although the most general form of the term includes
-- such things as lists of lists, the terms is reserved here for a
-- collection of **atom**s.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include boolean.e -- for 'FALSE', 'TRUE'
include sequence.e -- for 'fold'
--------------------------------------------------------------------------------
function add(atom a, atom b) -- (a -> a) -> a
    return a + b
end function
--------------------------------------------------------------------------------
function multiply(atom a, atom b) -- (a -> a) -> a
    return a * b
end function
--------------------------------------------------------------------------------
export type list(sequence this) -- ({o}) -> [a]
    for n = 1 to length(this) do
        if atom(this[n])
        then continue
        else return FALSE
        end if
    end for
    return TRUE
    end type
    export function sum(list l) -- ([a]) -> a
        return fold(l, "add", 0)
    end function
    export function product(list l) -- ([a]) -> a
        return fold(l, "multiply", 1)
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
