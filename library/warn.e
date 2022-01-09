--------------------------------------------------------------------------------
-- warn.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria warnings library
-- Version: 4.0.5.1
-- Author: C A Newbould
-- Date: 2022.01.03
-- Status: incomplete
-- Changes:
--* ##warn## changed to use Channel 2
--
--==Open Euphoria extension library: warn
--This library contains tools to aid the identification and
--reporting of warnings in Open Euphoria.
--
--==Interface
--
--<eucode>type integer</eucode>
--*/
--------------------------------------------------------------------------------
    export function warn(integer warnvalue) -- (i) -> i
        printf(2, "** WARNING **: code = %d\n", {warnvalue})
        return warnvalue
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version: 4.0.5.0
-- Author: C A Newbould
-- Date: 2022.01.02
-- Status: incomplete
-- Changes:
--* ##warn## moved from //object.e//
--------------------------------------------------------------------------------
