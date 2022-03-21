--------------------------------------------------------------------------------
-- Library: address.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria machine-based library
-- Version: 4.1.0.2
-- Author: C A Newbould
-- Date: 2022.03.17
-- Status: complete
-- Changes:
--* added **free**
--
--==Open Euphoria extension library: address
--
-- This library contains material for accessing ram.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
--/*
--===Type: address
--*/
--------------------------------------------------------------------------------
export type address(atom this) -- a->addr
    return this >=0
    end type
    export function Address(atom l) -- a->addr
        return machine_func(16,l)
    end function
    export function free(address a)
        machine_proc(17, a)
        return 0
    end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version: 4.1.0.1
-- Author: C A Newbould
-- Date: 2022.03.02
-- Status: complete
-- Changes:
--* removed ##toC##
--* added **address**
--------------------------------------------------------------------------------
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.02.28
-- Status: complete
-- Changes:
--* created
--------------------------------------------------------------------------------
