--------------------------------------------------------------------------------
-- creole.ex
--------------------------------------------------------------------------------
-- Version 4.0.5.1
-- Date: 2022.01.03
-- Author: C A Newbould
-- Status: operational
-- Changes:
--* altered by virtue of changed default in //creole.e//
--* more documentation
--------------------------------------------------------------------------------
-- This application demonstrates a way of changing the target "screen" to
-- a webbrowser tab rather than using a pop-up terminal window.
--
-- This approach uses the creole markup language to construct and lay out the
-- output of an Open Euphoria application.
--
-- It is part of the CANOE project: CAN's ideal Open Euphoria.
--
-- A parallel app uses html coding, missing out the intermediate step, provided
-- by creole, but requiring some detailed knowledge of html.
--
-- A third app uses an IUP dialog for the same display purpose.
--
-- The overall project will assess the relative merits of each before a
-- preference is expressed.
--------------------------------------------------------------------------------
-- The action starts here:
--* include the support library
--* start to write output using the dedicated functions in the library
--
-- These functions send output to a '.cr' file rather than to
-- the standard output stream, but are largely similar in effect:
-- being based on the three OE mainstays of 'puts', 'print' and 'printf'.
--------------------------------------------------------------------------------
include library/creole.e -- for 'display', 'prnt', 'write', 'writef'
--------------------------------------------------------------------------------
-- Write output, mirroring "normal" output to STDOUT,
-- but you can, if you wish, take advantage of creole's headers and layout
-- styles.
--------------------------------------------------------------------------------
write("=Testing", 1) -- using creole heading
write("==Using list.e", 1) -- also using a creole heading
--------------------------------------------------------------------------------
-- Define raw data for this particular illustration
--------------------------------------------------------------------------------
include library/list.e -- for 'product', 'sum'
include library/ints.e -- for 'Ints'
constant l = Ints(1,5) -- conforms to FP convention over expressions
--------------------------------------------------------------------------------
-- More output coming up
--
-- Note use of creole tags to highlight elements of the output
--------------------------------------------------------------------------------
write("The //list// is [1..5]")
writef(sum(l),"The ##sum## = %d")
writef(product(l), "The ##product## = %d")
write("##head##(//list//) -> ", 0) prnt(head(l)) -- this is the OE Core version
--------------------------------------------------------------------------------
include library/sequence.e -- for 'head_', 'last', 'init', 'tail'
--------------------------------------------------------------------------------
-- More output, written line-by-line for illustrative purposes, but also to
-- emphasise that 'write' can issue as many carriage-returns as needed by the
-- creole translator - the default for 'write' is two - but here, by using '0',
-- holding the line for the 'prnt' output, to emphasise that the result is
-- displayed on the same line as the prompt.
--
-- A limitation of 'creole' is that there has to be a gap between lines in order
-- to ensure a line-feed.
--------------------------------------------------------------------------------
write("##last##(//list//) -> ", 0) prnt(last(l))
write("##init##(//list//) -> ", 0) prnt(init(l))
write("##tail##(//list//) -> ", 0) prnt(tail(l))
write("##head_##(//list//) -> ", 0) prnt(head_(l)) -- this is the CANOE version
--------------------------------------------------------------------------------
-- We have now completed our output, so we want to:
--
--* finish off
--* choose our destination browser
--* display our result, using the 'display' function
--
-- This function closes the output stream (of our creole-based material) and shows
-- the result in the browser tab.
--
-- The default browser is, in fact, part of the IUP GUI, but you can use whatever
-- browser you have on your system.
--
-- To change the browser use an appropriate parameter value in ##Display##.
-- It should be the **string** name as recognised by the current OS
-- (for example "firefox", "safari" or, in MS Windows, "start" which will call
-- the default system browser).
--
-- The function will do its housekeeping and then open a new browser tab,
-- containing the output in html style.
--
-- The system may issue browser-related messages to the Terminal window; these
-- can safely be ignored.
--
-- Two files are left in the folder from which this app is called:
--
--* test.cr
--* test.html
--
-- the former holding the intermediate markup code; the latter the html.
--
-- This app continues to overwrite these files, so there is no especial need
-- to delete them each time.
--
-- They could be even useful in the event of an error in the output, as both are
-- perfectly readable.
--------------------------------------------------------------------------------
display() -- with the "IUP" default: a [string] parameter will change the browser used
--------------------------------------------------------------------------------
-- NB: STDERR is now clear for its proper purpose, as shown here
--------------------------------------------------------------------------------
include library/warn.e
warn(888)
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
-- Version 4.0.5.0
-- Date: 2022.01.03
-- Author: C A Newbould
-- Status: operational
-- Changes:
--* created
--* fully-documented
--* tested
--* revised after transfer of material to 'library/creole.e'
--------------------------------------------------------------------------------
