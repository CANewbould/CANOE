--------------------------------------------------------------------------------
-- dialog.ex
--------------------------------------------------------------------------------
-- Version 4.0.5.0
-- Date: 2022.01.03
-- Author: C A Newbould
-- Status: operational
-- Changes:
--* copied from //creole.ex//
--* fully-documented
--* tested
--------------------------------------------------------------------------------
-- This application is a proof-of-concept: the target "screen" is
-- an IUP modal dialog rather than a terminal window.
--
-- This approach uses a string store to assemble the
-- output of an Open Euphoria application.
--
-- It is part of the CANOE project: CAN's ideal Open Euphoria.
--
-- A parallel app uses creole, whilst a third directly uses the full power of
-- html coding.
--
-- The overall project will assess the relative merits of each before a
-- preference is expressed.
--------------------------------------------------------------------------------
-- The action starts here:
--* open the support library
--------------------------------------------------------------------------------
include library/totext.e -- for 'display', 'write', 'writef'
--------------------------------------------------------------------------------
--* define raw data for this particular illustration
--------------------------------------------------------------------------------
include library/list.e -- for 'product', 'sum'
include library/ints.e -- for 'Ints'
constant l = Ints(1,5) -- conforms to FP convention over expressions
--------------------------------------------------------------------------------
--* write output, mirroring "normal" output to STDOUT.
--------------------------------------------------------------------------------
write("The list is [1..5]")
writef(sum(l),"The sum = %d\n")
writef(product(l), "The product = %d\n")
write("head(list) (this is the OE Core version) -> ", 0) writel(head(l))
--------------------------------------------------------------------------------
include library/sequence.e -- for 'head_', 'last', 'init', 'tail'
--------------------------------------------------------------------------------
--* more output, written line-by-line for illustrative purposes, but also to
--  emphasise that 'write' can issue as many carriage-returns as needed
--  - the default for 'write' is one - but here, by using '0', we can
--  hold the line for the 'writel' output, to emphasise that the result is
--  displayed on the same line as the prompt.
--------------------------------------------------------------------------------
writef(last(l), "last(list) -> %d\n")
write("init(list) -> ", 0) writel(init(l))
write("tail(list) -> ", 0) writel(tail(l))
writef(head_(l), "head_(list) -> %d (this is the CANOE version)\n")
--------------------------------------------------------------------------------
-- We have now completed our output, so we want to:
--
--* finish off
--* display our result, using the 'display' function
--------------------------------------------------------------------------------
display("Testing lists")
--------------------------------------------------------------------------------
-- NB: STDERR is now clear for its proper purpose, as shown here, so a
-- warning is fully separated from the main output
--------------------------------------------------------------------------------
puts(2, "!!! STDERR is now clear for its proper purpose !!!\n")
include library/warn.e
warn(888)
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
