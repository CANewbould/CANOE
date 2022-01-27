--------------------------------------------------------------------------------
-- sequence.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria sequence library
-- Version: 4.0.5.3
-- Author: C A Newbould
-- Date: 2022.01.18
-- Status: incomplete
-- Changes:
--* ##findAll## defined
--* ##filter_## defined
--* ##in## defined
--
--==Open Euphoria extension library: sequence
-- This library contains tools that apply to the in-built
-- **sequence** type of Open Euphoria.
--
-- This project takes a declarative approach to function definition and to
-- application development. Consequently the functions defined below are
-- generalised forms of functions used in "list comprehensions".
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include boolean.e -- for 'boolean', 'iif'
include object.e -- for 'cons', 'o2s'
include string.e -- for 'string'
--------------------------------------------------------------------------------
export constant EMPTY = {}
--------------------------------------------------------------------------------
function goOn(object this, object that) -- (o -> o) -> b
    if atom(this)
    then if atom(that)
         then return not (this = that)
         else return not (equal(o2s(this), that))
         end if
    else if atom(that) -- this is a sequence
         then return not (equal(this, o2s(that)))
    else return not equal(this, that)
         end if
    end if
end function
--------------------------------------------------------------------------------
export function apply(string fn, object args, atom ending, integer func = routine_id(fn)) --> (o -> o) -> a -> {o}
    sequence ret = EMPTY
    if atom(args) then args = o2s(args)
    else args = args
    end if
    object next = call_func(func, args)
    while goOn(next, ending) do
        ret = append(ret, next)
        next = call_func(func, args)
    end while
    return ret
end function
--------------------------------------------------------------------------------
--/*
--<eucode>global type sequence</eucode>
--*/
--------------------------------------------------------------------------------
    export enum AFTER = 0, BEFORE
    export function add2(sequence s, object o, integer i = AFTER) -- f([o] -> o -> i) -> [o] - adds 'o' after|before|ith-pos-of 's'
        if i = AFTER then return append(s, o)   -- uses Core routine
        else return splice(s, o, i) -- i is positive (BEFORE = 1) so prepend subsumed
        end if
    end function
    export function filter(sequence s, string fn, object target, integer func = routine_id(fn)) -- f([o] -> f(o -> o) -> b)) -> [o]
        switch length(s) do
            case 0 then return EMPTY
            case 1 then return iif(call_func(func, {head_(s), target}), o2s(head_(s)), EMPTY)
            case else
                sequence bef = filter(init(s), fn, target, func)
                boolean lst = call_func(func, {last(s), target})
                return iif(lst, append(bef, last(s)), bef)
        end switch
    end function
    export function filter_(sequence s, string fn, integer func = routine_id(fn)) -- f([o] -> f(o -> b)) -> [o]
        switch length(s) do
            case 0 then return EMPTY
            case 1 then return iif(call_func(func, {head_(s)}), o2s(head_(s)), EMPTY)
            case else
                sequence bef = filter_(init(s), fn, func)
                boolean lst = call_func(func, {last(s)})
                return iif(lst, append(bef, last(s)), bef)
        end switch
    end function
    export function findAll(sequence s, object o) -- f([o]->o) -> [i]
        sequence res = EMPTY
        integer n = find(o, s)
        while n do res &= n n = find(o, s, n+1) end while
        return res
    end function
    export function fold(sequence s, string fn, object start, integer func = routine_id(fn)) -- {o} -> ((o -> o) -> o) -> o
        switch length(s) do
            case 0 then return EMPTY
            case 1 then return call_func(func, {head_(s), start})
            case else return call_func(func, {last(s), fold(init(s), fn, start, func)})
        end switch
    end function
    export function head_(sequence s) -- f([o]) -> o
        return s[1]
    end function
    export function in(sequence s, object o) -- f([o]->o) -> i
        return find(o,s)
    end function
    export function init(sequence s) -- f([o]) -> [o]
        return s[1..$-1]
    end function
    export function last(sequence s) -- ({o}) -> o
        return s[$]
    end function
    export function map(sequence s, string fn, object val, integer func = routine_id(fn)) -- f([o] -> f(o -> o) -> o) -> [o]
        switch length(s) do
            case 0 then return EMPTY
            case 1 then return {call_func(func, {head_(s), val})}
            case else return append(map(init(s), fn, val, func), call_func(func, {last(s), val}))
        end switch
    end function
    export function map_(sequence s, string fn, integer func = routine_id(fn)) -- f([o] -> f(o) -> o) -> [o]
        switch length(s) do
            case 0 then return EMPTY
            case 1 then return o2s(call_func(func, o2s(head_(s))))
            case else
                for n = 1 to length(s) do
                    s[n] = call_func(func, o2s(s[n]))
                end for
                return s
        end switch
    end function
    export function reverse(sequence s) -- f([o]) -> [o]
        switch length(s) do
        case 0, 1 then return s
        case else return cons(last(s), reverse(init(s)))
        end switch
    end function
    export function tail(sequence s) -- f([o]) -> [o]
        return s[2..$]
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version: 4.0.5.2
-- Author: C A Newbould
-- Date: 2022.01.12
-- Status: incomplete
-- Changes:
--* ##add2## defined
--------------------------------------------------------------------------------
-- Version: 4.0.5.1
-- Author: C A Newbould
-- Date: 2022.01.03
-- Status: incomplete
-- Changes:
--* ##head## renamed ##head_##
--* documentation expanded
--* ##filter## revised
--* ##fold## revised
--------------------------------------------------------------------------------
-- Version: 4.0.5.0
-- Author: C A Newbould
-- Date: 2022.01.02
-- Status: incomplete
-- Changes:
--* created
--* //EMPTY// moved
--* ##filter## defined
--* ##fold## defined
--* ##map## defined
--* ##map_## defined
--* ##reverse## defined
--* ##apply## added
--* ##last## defined
--* ##init## defined
--* ##head## defined
--* ##tail## defined
--------------------------------------------------------------------------------
