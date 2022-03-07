--------------------------------------------------------------------------------
-- Library: sequence.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria sequence library
-- Version: 4.1.0.2
-- Author: C A Newbould
-- Date: 2022.03.04
-- Status: complete
-- Changes:
--* defined ##add2##
--* corrected ##s2a##
--* extended ##split##
--
--==Open Euphoria extension library: sequence
--
-- This library contains material that applies to the built-in
-- **sequence** class.
--
-- Note that the ##foldr## function also effects ##map##s and
-- ##filter##s, by defaulting the third arguments to the empty
-- sequence.
--
--==Interface
--
--===Includes
--
--*/
--------------------------------------------------------------------------------
include address.e
include boolean.e
include ints.e
--------------------------------------------------------------------------------
--/*
--===Type: sequence
--*/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--/*
--===Type: sequence
--
--<eucode>global type sequence</eucode>
--*/
--------------------------------------------------------------------------------
    export function add2(sequence s, object o, integer i=length(s)) -- [o]->o->[o]
        if i = 1 then return  cons(o,s)
        elsif i = length(s) then return s&o
        else return s[1..i-1] & cons(o,s[i..$])
        end if
    end function
    export function cons(object o,sequence s) -- o->[o]->[o]
        return {o}&s
    end function
    export function foldl(sequence s, sequence fn, object start={}, integer func = routine_id(fn)) -- [o]->(o->o->o)->o
        switch length(s) do
            case 0 then return {}
            case 1 then return call_func(func, {s[$],start})
            case else return call_func(func, {s[1], foldl(s[2..$], fn, start, func)})
        end switch
    end function
    export function foldr(sequence s, sequence fn, object start={}, integer func = routine_id(fn)) -- [o]->(o->o->o)->o
        switch length(s) do
            case 0 then return {}
            case 1 then return call_func(func, {s[1], start})
            case else return call_func(func, {s[$], foldr(s[1..$-1], fn, start, func)})
        end switch
    end function
    export function init(sequence s) -- [o]->[o]
        return s[1..$-1]
    end function
    export function reverse(sequence s) -- [o]->[o]
        return foldr(s,"cons")
    end function
    function s2(integer x, integer y) -- c->i->i
        return (x-48) + 10*y
    end function
    export function s2a(sequence n) -- [c]->a - converts a string "atom" to its digit form
        boolean sgn = FALSE
        if n[1] = '-' then
            sgn = TRUE
            n = tail(n)
        end if
        integer dp = find('.',n)
        if dp then
            sequence dpart = n[dp+1..$]
            atom ret = s2i(n[1..dp-1]) + s2i(dpart)/power(10,length(dpart))
            return iif(sgn,0-ret,ret)
        else return s2i(n)
        end if
    end function
    export function s2i(sequence n) -- [c]->i - converts a string "integer" to its digit form
        if n[1] = '-' then return 0 - foldr(tail(n), "s2", 0)
        else return foldr(n, "s2", 0)
        end if
    end function
    export function s2c(sequence s,atom l=length(s)+1) -- [c]->a
        s &= 0
        atom a = Address(l)
        poke(a,s)
        return a
    end function
    export function split(sequence this,sequence s=" ") -- [c]->[c]->[[c]] - separates a string into words
        integer l = length(this), i = 1
        sequence bit = ""
        sequence ret = {}
        while i <= l do
            if find(this[i],s) then
                if length(bit) then ret = append(ret, bit) end if
                bit = ""
            else bit &= this[i]
            end if
            i += 1
        end while
        if length(bit) then ret = append(ret, bit) end if
        return ret
    end function
    export function tail(sequence s) -- [o]->[o]
        return s[2..$]
    end function
    export function toC(sequence s) -- [c]->a
        return s2c(s)
    end function
    function lower(integer c,sequence b) -- c->[c]->[c]
        if find(c, Ints('Z','A')) then c += 32 end if
        return b&c
    end function
    export function toLower(sequence s) -- [c]->[c]
        return foldr(s,"lower")
    end function
    function upper(integer c,sequence b) -- c->[c]->[c]
        if find(c, Ints('z','a')) then c -= 32 end if
        return b&c
    end function
    export function toUpper(sequence s) -->  [c]->[c]
        return foldr(s,"upper")
    end function
    constant WHITE_SPACE = Ints(13,9) & ' '
    function trm(sequence s) -- [c]->[c]
        for i=1 to length(s) do
            if find(s[i],WHITE_SPACE) then continue
            else return s[i..$]
            end if
        end for
    end function
    export enum BEGINNING, ENDING, BOTH
    export function trim(sequence this, integer where = BEGINNING) -- [c]->i->[c] - removes leading/trailing spaces
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
-- Version: 4.1.0.1
-- Author: C A Newbould
-- Date: 2022.03.03
-- Status: complete
-- Changes:
--* defined ##toLower##
--* defined ##toUpper##
--* defined ##foldl##
--* defined ##cons##
--* defined ##split##
--* defined ##trim##
--* defined ##reverse##
--------------------------------------------------------------------------------
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.03.02
-- Status: complete
-- Changes:
--* created
--* copied ##toC## and extended definition
--* defined ##foldr##
--* defined ##init##
--* defined ##s2i##
--* defined ##s2a##
--* defined ##tail##
--------------------------------------------------------------------------------
