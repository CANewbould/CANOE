--------------------------------------------------------------------------------
-- atom.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria atom library
--* Version: 4.0.5.0
--* Author: C A Newbould
--* Date: 2022.01.02
--* Status: incomplete
--* Changes:
--** created
--** ##abs## defined
--** ##sign## defined
--
--==Open Euphoria extension library: atom
--This library contains tools that apply to the in-built
--**atom** type of Open Euphoria.
--
--==Interface
--*/
--------------------------------------------------------------------------------
include boolean.e -- for 'iif'
--------------------------------------------------------------------------------
--/*
--<eucode>global type atom</eucode>
--*/
--------------------------------------------------------------------------------
    export function abs(atom a) -- (a) -> a
        return iif(a, a, 0-a)
    end function
    export function sign(atom a) -- (a) -> a
        if a = 0 then return 0
        elsif a > 0 then return 1
        else return -1
        end if
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
