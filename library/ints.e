--------------------------------------------------------------------------------
-- ints.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria ints library
-- Version: 4.0.5.0
-- Author: C A Newbould
-- Date: 2022.01.02
-- Status: incomplete
-- Changes:
--* created
--* **ints** defined
--* ##Ints## defined
--
--==Open Euphoria extension library: ints
--This library contains a selection of basic tools that apply to the
--**ints** type defined here.
--
--An **ints** is a specialised **sequence**, where all the elements are
--**integer**s.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include boolean.e -- for 'FALSE', 'TRUE'
include object.e -- for 'cons', 'o2s'
--------------------------------------------------------------------------------
export type ints(sequence this) --> {o} -> [i]
    for n = 1 to length(this) do
        if integer(this[n])
        then continue
        else return FALSE
        end if
    end for
    return TRUE
    end type
    export function Ints(integer this, integer that, integer step = 1) -- (i -> i -> i) -> [i]
        if that < this then return {}
        else
            switch (that-this) do
                case 0 then return o2s(this)
                case else return cons(this, Ints(this+step, that, step))
            end switch
        end if
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
