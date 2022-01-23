--------------------------------------------------------------------------------
-- warn.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria warnings library
-- Version: 4.0.5.2
-- Author: C A Newbould
-- Date: 2022.01.18
-- Status: incomplete
-- Changes:
--* ##warn## generalised to take any object
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
    export function warn(object warnvalue) -- (o) -> o
        if atom(warnvalue) then
            printf(2, "** WARNING **: code = %d\n", {warnvalue})
        else
            puts(2, "** WARNING **: " & warnvalue & ".\n")
        end if
        return warnvalue
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version: 4.0.5.1
-- Author: C A Newbould
-- Date: 2022.01.03
-- Status: incomplete
-- Changes:
--------------------------------------------------------------------------------
--* ##warn## changed to use Channel 2
-- Version: 4.0.5.0
-- Author: C A Newbould
-- Date: 2022.01.02
-- Status: incomplete
-- Changes:
--* ##warn## moved from //object.e//
--------------------------------------------------------------------------------
