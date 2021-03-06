--------------------------------------------------------------------------------
-- Library: sequence.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria sequence library
-- Version: 4.1.0.7
-- Author: C A Newbould
-- Date: 2022.03.14
-- Status: complete
-- Changes:
--* added ##map## for convenience
--
--==Open Euphoria extension library: sequence
--
-- This library contains material that applies to the built-in
-- **sequence** type and also the derivative types:
--
--* list
--* string
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
include address.e -- for 'Address'
include boolean.e -- for 'boolean','FALSE','iif','TRUE'
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
    export function filter(sequence s, sequence fn, object o, integer func = routine_id(fn)) -- [o]->(o->o->b)->[o]
        switch length(s) do
        case 0 then return {}
        case 1 then return iif(call_func(func,{s[1],o}),s,{})
        case else
            sequence f = filter(init(s),fn,o,func)
            return iif(call_func(func,{s[$],o}),f&s[$],f)
        end switch
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
    export function map(sequence s, sequence fn, integer func = routine_id(fn)) --[o]->(o->o)->[o]
        switch length(s) do
            case 0 then return {}
            case 1 then return {call_func(func, {s[1]})}
            case else return map(init(s), fn, func) & call_func(func, {s[$]})
        end switch
    end function
    export function reverse(sequence s) -- [o]->[o]
        return foldr(s,"cons")
    end function
    -- Creator functions
    function equals(object a,object b) -- o->o->b
        if atom(a) then return a=b
        else return equal(a,b)
        end if
    end function
    export function cons(object o,sequence s) -- o->[o]->[o]
        return {o}&s
    end function
    export function perform(sequence fn, object args, object o, atom func=routine_id(fn)) -- (o->o)--> [o]
        sequence res = {}
        object r
        if atom(args) then args = {args} end if
        while not equals(r,o) with entry do
            res = append(res,r)
            entry r = call_func(func,args)
        end while
        return res
    end function
--------------------------------------------------------------------------------
--/*
--===Type: (string) sequence
--*/
--------------------------------------------------------------------------------
type string(object s)
    return sequence(s)
    end type
    export function endsWith(string this, string that) -- [c]->[c]->b - is 'that' the last non-blank part of 'this'
        return startsWith(reverse(this),reverse(that))
    end function
    function s2(integer x, integer y) -- c->i->i
        return (x-48) + 10*y
    end function
    export function s2a(string n) -- [c]->a - converts a string "atom" to its digit form
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
    export function s2i(string n) -- [c]->i - converts a string "integer" to its digit form
        if n[1] = '-' then return 0 - foldr(tail(n), "s2", 0)
        else return foldr(n, "s2", 0)
        end if
    end function
    export function s2c(string s,atom l=length(s)+1) -- [c]->a
        s &= 0
        atom a = Address(l)
        poke(a,s)
        return a
    end function
    export function split(string this,sequence s=" ") -- [c]->[c]->[[c]] - separates a string into words
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
    export function startsWith(string this, string that) -- [c]->[c]->b - is 'that' the first non-blank part of 'this'
        string s = trim(this)
        if length(s) >= length(that)
        then
            return iif(equal(that,s[1..length(that)]),TRUE,FALSE)
        else return FALSE
        end if
    end function
    export function toC(string s) -- [c]->a
        return s2c(s)
    end function
    function lower(integer c,sequence b) -- c->[c]->[c]
        if find(c, range('Z','A')) then c += 32 end if
        return b&c
    end function
    export function toLower(string s) -- [c]->[c]
        return foldr(s,"lower")
    end function
    function upper(integer c,sequence b) -- c->[c]->[c]
        if find(c, range('z','a')) then c -= 32 end if
        return b&c
    end function
    export function toUpper(string s) -->  [c]->[c]
        return foldr(s,"upper")
    end function
    constant WHITE_SPACE = range(13,9) & ' '
    function trm(string s) -- [c]->[c]
        for i=1 to length(s) do
            if find(s[i],WHITE_SPACE) then continue
            else return s[i..$]
            end if
        end for
    end function
    export enum BEGINNING, ENDING, BOTH
    export function trim(string this, integer where = BEGINNING) -- [c]->i->[c] - removes leading/trailing spaces
        switch where do
        case BEGINNING then return trm(this)
        case ENDING then return reverse(trm(reverse(this)))
        case BOTH then return trim(trim(this,ENDING))
        case else return this
        end switch
    end function
--------------------------------------------------------------------------------
--/*
--===Type: (list) sequence
--*/
--------------------------------------------------------------------------------
type list(object l)
    return sequence(l)
    end type
    export function init(list s) -- [o]->[o]
        return s[1..$-1]
    end function
    export function tail(list s) -- [o]->[o]
        return s[2..$]
    end function
    -- creator
    export function range(integer last,integer first=1,integer step=1) -- i->i->i->[i]
        if last < first then return {}
        else
            switch (last-first) do
            case 0 then return {last}
            case else return cons(first,range(last,first+step, step))
            end switch
        end if
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version: 4.1.0.6
-- Author: C A Newbould
-- Date: 2022.03.13
-- Status: complete
-- Changes:
--* added ##startsWith##
--* added ##endsWith##
--------------------------------------------------------------------------------
-- Version: 4.1.0.5
-- Author: C A Newbould
-- Date: 2022.03.11
-- Status: complete
-- Changes:
--* soft definition of **string**
--* soft definition of **list**
--* rearranged material accordingly
--* re-defined ##range## recursively
--* generalised ##perform##
--------------------------------------------------------------------------------
-- Version: 4.1.0.4
-- Author: C A Newbould
-- Date: 2022.03.10
-- Status: complete
-- Changes:
--* defined ##range##
--------------------------------------------------------------------------------
-- Version: 4.1.0.3
-- Author: C A Newbould
-- Date: 2022.03.09
-- Status: complete
-- Changes:
--* defined ##filter##
--* defined ##perform##
--------------------------------------------------------------------------------
-- Version: 4.1.0.2
-- Author: C A Newbould
-- Date: 2022.03.04
-- Status: complete
-- Changes:
--* defined ##add2##
--* corrected ##s2a##
--* extended ##split##
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
