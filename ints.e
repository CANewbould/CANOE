--------------------------------------------------------------------------------
-- Library: ints.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria integer list library
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.02.28
-- Status: complete
-- Changes:
--* created
--
--==Open Euphoria extension library: ints
--
-- This library contains material for generating integer lists.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function Ints(integer last,integer first=1,integer step=1)
    sequence i = {}
    for n = first to last by step do
        i &= n
    end for
    return i
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
