--------------------------------------------------------------------------------
-- string.e
--------------------------------------------------------------------------------
-- Notes
--
-- Consider s2a function
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria string library
-- Version: 4.0.5.5
-- Author: C A Newbould
-- Date: 2022.01.26
-- Status: incomplete
-- Changes:
--* ##endsWith## defined
--* ##capitalise## defined
--
--== Open Euphoria extension library: string
-- This library contains tools that apply to the **string** type defined here.
--
-- A **string** is a specialised **sequence**, where all the elements are
-- printable characters.
--
--== Interface
--
--*/
--------------------------------------------------------------------------------
include address.e -- for 'Address'
include boolean.e -- for 'FALSE', 'TRUE'
include char.e -- for 'char', 'lower', 's2', 'upper'
include ints.e -- for 'Ints'
include sequence.e -- for 'map'
--------------------------------------------------------------------------------
constant WHITE_SPACE = Ints(9,13) & ' '
function trm(string this) -- f([c]) -> [c]
    if length(this) = 0 then return this end if
    if find(this[1],WHITE_SPACE) then
        integer i = 1
        loop do
            i += 1
            until not find(this[i],WHITE_SPACE) or i = length(this)
        end loop
        if i = length(this) then return {}
        else return this[i..$]
        end if
    else return this
    end if
end function
--------------------------------------------------------------------------------
--/*
--=== The string class
--*/
--------------------------------------------------------------------------------
export type string(sequence this) -- t([o]) -> [c] - sequence of character elements
    for n = 1 to length(this) do
        if char(this[n])
        then continue
        else ?this[n] return FALSE
        end if
    end for
    return TRUE
    end type
    export function capitalise(string this) -- f([c]) -> [c]
        return prepend(tail(this), upper(head_(this)))
    end function
    export function endsWith(string this, string that) -- f([c] -> [c]) -> b - is 'that' the last non-blank part of 'this'
        return startsWith(reverse(this),reverse(that))
    end function
    constant NULL = 0
    export function s2c(string s, integer l = length(s)+1) -- f([c] -> i) -> addr - more general than 'allocate_string'
        atom mem = Address(l)
    	if mem then poke(mem, s & NULL)
        else mem = 0
    	end if
    	return mem
    end function
    export function s2i(string n) -- f([c]) -> i - converts a string "integer" to its digit form
        if head_(n) = '-' then return 0 - fold(tail(n), "s2", 0)
        else return fold(n, "s2", 0)   
        end if
    end function
    export function split(string this) -- f([c]) -> [[c]] - separates a string into words
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
    export function startsWith(string this, string that) -- f([c] -> [c]) -> b - is 'that' the first non-blank part of 'this'
        string s = trim(this)
        if length(s) >= length(that)
        then
            return iif(equal(that,s[1..length(that)]),TRUE,FALSE)
        else return FALSE
        end if
    end function
    export function toLower(string this) -- f([c]) -> [c]
        return map_("lower", this)
    end function
    export function toUpper(string this) -->  f([c]) -> [c]
        return map_("upper", this)
    end function
    export enum BEGINNING, ENDING, BOTH
    export function trim(string this, integer where = BEGINNING) -- f([c] -> i) -> [c] - removes leading/trailing spaces
        switch where do
        case BEGINNING then return trm(this)
        case ENDING then return reverse(trm(reverse(this)))
        case BOTH then return trim(trim(this,ENDING))
        case else return this
        end switch
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version: 4.0.5.4
-- Author: C A Newbould
-- Date: 2022.01.19
-- Status: incomplete
-- Changes:
--* ##trim## extended to allow for all white-space characters
--------------------------------------------------------------------------------
-- Version: 4.0.5.3
-- Author: C A Newbould
-- Date: 2022.01.17
-- Status: incomplete
-- Changes:
--* error in signature of ##s2i## corrected
--* ##s2i## extended to allow a negative value
--------------------------------------------------------------------------------
-- Version: 4.0.5.2
-- Author: C A Newbould
-- Date: 2022.01.10
-- Status: incomplete
-- Changes:
--* ##trim## defined
--* ##startsWith## defined
--* ##s2c## extended
--------------------------------------------------------------------------------
-- Version: 4.0.5.1
-- Author: C A Newbould
-- Date: 2022.01.09
-- Status: incomplete
-- Changes:
--* ##split## defined
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
