--------------------------------------------------------------------------------
-- boolean.e
--------------------------------------------------------------------------------
--/*
--=A basic boolean library
--
--Version: 4.1.0.3
--Author: C A Newbould
--Date: 2022.01.02
--Status: operational; complete
--Changes:
--* modified layout
--* changed //public// to //export//
--
--==Open Euphoria extension library: boolean
--
--This library contains the basic elements of a boolean (TRUE/FALSE) library for
--the Euphoria Programming Language.
--
--Note that Euphoria expressions do not strictly return //TRUE//, but instead
--return a positive value, which corresponds to //TRUE//.
--
--Also note that, as a convention here, the 'if .. then .. else .. end if'
--construct is generally laid out
--as follows:
--<eucode>if ... then ..
--[[elsif .. then ..]..]
--else ..
--end if</eucode>
--
--Users are encouraged to use this construct, and the functional ##iif##
--equivalent, always with the 'else' coded.
--
--==Interface
--===Constants
--*/
--------------------------------------------------------------------------------
export constant FALSE = 0 -- v4.0.5.1
export constant TRUE = not FALSE -- v4.0.5.1
--------------------------------------------------------------------------------
export type boolean(integer this) -- (i) -> b
    return TRUE -- all integers apply -- v4.0.5.1
    end type
    export function iif(boolean test, object ifTrue = "TRUE", object ifFalse = "FALSE") -- (b -> o -> o) -> o
        if test then return ifTrue
        else return ifFalse
        end if
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--*Version: 4.0.5.2
--*Author: C A Newbould
--*Date: 2021.12.10
--*Status: operational; complete
--*Changes:
--** modified ##iif## to give it defaults
--------------------------------------------------------------------------------
--*Version: 4.0.5.1
--*Author: C A Newbould
--*Date: 2021.10.04
--*Status: operational; complete
--*Changes:
--** modified //FALSE// and //TRUE// to Euphoria standard
--------------------------------------------------------------------------------
--*Version: 4.0.5.0
--*Author: C A Newbould
--*Date: 2020.06.12
--*Status: operational; complete
--------------------------------------------------------------------------------
