--------------------------------------------------------------------------------
-- atom.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria atom library
--* Version: 4.1.0.2
--* Author: C A Newbould
--* Date: 2022.03.28
--* Status: incomplete
--* Changes:
--** ##isPositive## added
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
    export function isPositive(atom a) -- (a) -> b
        return a > 0
    end function
    export function sign(atom a) -- (a) -> i
        if a = 0 then return 0
        elsif a > 0 then return 1
        else return -1
        end if
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--* Version: 4.1.0.1
--* Author: C A Newbould
--* Date: 2022.01.23
--* Status: incomplete
--* Changes:
--** created
--** ##sign## revised
--------------------------------------------------------------------------------
--* Version: 4.0.5.0
--* Author: C A Newbould
--* Date: 2022.01.02
--* Status: incomplete
--* Changes:
--** created
--** ##abs## defined
--** ##sign## defined
--------------------------------------------------------------------------------
