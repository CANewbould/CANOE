--------------------------------------------------------------------------------
-- string.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria string library
-- Version: 4.0.5.1
-- Author: C A Newbould
-- Date: 2022.01.09
-- Status: incomplete
-- Changes:
--* ##split## defined
--
--==Open Euphoria extension library: string
--This library contains tools that apply to the
--**string** type defined here.
--
--A **string** is a specialised **sequence**, where all the elements are
--printable characters.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include address.e -- for 'Address'
include boolean.e -- for 'FALSE', 'TRUE'
include char.e -- for 'char', 'lower', 's2c', 'upper'
include ints.e -- for 'Ints'
include sequence.e -- for 'map'
--------------------------------------------------------------------------------
export type string(sequence this) -- {o} -> [c]
    for n = 1 to length(this) do
        if char(this[n])
        then continue
        else return FALSE
        end if
    end for
    return TRUE
    end type
    constant NULL = 0
    export function s2c(string s) -- [c] -> a
        ints i = s & NULL
        atom mem = Address(length(i))
    	if mem then poke(mem, i)
        else mem = 0
    	end if
    	return mem
    end function
    export function s2i(string n) -- [c] -> i
        return fold("s2", 0, n)
    end function
    export function split(string this) -- f([c]) -> [[c]]
        integer l = length(this), i = 1
        string bit = ""
        sequence ret = {}
        while i <= l do
            if this[i] = ' ' then ret = append(ret, bit) bit = ""
            else bit &= this[i]
            end if
            i += 1
        end while
        if length(bit) then ret = append(ret, bit) end if
        return ret
    end function
    export function toLower(string this) -- [c] -> [c]
        return map_("lower", this)
    end function
    export function toUpper(string this) -->  [c] -> [c]
        return map_("upper", this)
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
--* **string** defined
--* ##s2i## defined
--* ##s2c## defined
--* ##toLower## defined
--* ##toUpper## defined
--------------------------------------------------------------------------------
