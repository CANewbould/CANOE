--------------------------------------------------------------------------------
-- integer.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria integer library
-- Version: 4.0.5.0
-- Author: C A Newbould
-- Date: 2022.01.02
-- Status: incomplete
-- Changes:
--* created
--* ##mod## defined
--
--==Open Euphoria extension library: integer
--This library contains tools that apply to the in-built
--**integer** type of Open Euphoria.
--
--==Interface
--
--<eucode>global type integer</eucode>
--*/
--------------------------------------------------------------------------------
    export function mod(integer i, integer j) -- (i -> i) -> i
        return remainder(i, j)
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
