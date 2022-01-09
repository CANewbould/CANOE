--------------------------------------------------------------------------------
-- html.ex
--------------------------------------------------------------------------------
-- Version 4.0.5.0
-- Date: 2022.01.03
-- Author: C A Newbould
-- Status: operational
-- Changes:
--* created
--* fully-documented
--* tested
--------------------------------------------------------------------------------
-- This application is a proof-of-concept: the target "screen" is
-- a webbrowser tab rather than a terminal window.
--
-- This approach uses html markup language to construct and lay out the
-- output of an Open Euphoria application. So, obviously, the user needs a good
-- working knowledge of html code.
--
-- It is part of the CANOE project: CAN's ideal Open Euphoria.
--
-- A parallel app uses creole markup coding and a third app uses an IUP dialog
-- for the same display purpose.
--
-- The overall project will assess the relative merits of each before a
-- preference is expressed.
--------------------------------------------------------------------------------
-- The action starts here:
--* open the support library
--* start to write output using the dedicated functions in the library
--
-- These functions sent output to a '.html' file rather than to
-- the standard output stream, but are largely similar in effect:
-- being based on the three OE mainstays of 'puts', 'print' and 'printf'.
--------------------------------------------------------------------------------
include library/html.e -- for 'display', 'prnt', 'write', 'writef'
--------------------------------------------------------------------------------
-- Write output, mirroring "normal" output to STDOUT, but you can, if you wish,
-- take advantage of html's headers and layout styles.
--
-- It is important to ensure that the general structure of an html file is
-- ensured; it is up to the user to do that, as illustrated here.
--------------------------------------------------------------------------------
write("<head>") -- necessary
write("<title>Testing</title>") -- using html code
write("</head><body>")
write("<h1>Using list.e</h1>") -- also using html code
--------------------------------------------------------------------------------
-- Define raw data for this particular illustration
--------------------------------------------------------------------------------
include library/list.e -- for 'product', 'sum'
include library/ints.e -- for 'Ints'
constant l = Ints(1,5) -- conforms to FP convention over expressions
--------------------------------------------------------------------------------
-- More output coming up
--
-- Note use of html tags to highlight elements of the output
--
-- A limitation of html is that there has to be a gap between lines in order
-- to ensure a line-feed, effected via the <p> tag.
--------------------------------------------------------------------------------
write("<p>The <b>list</b> is [1..5]")
writef(sum(l),"<p>The <tt>sum</tt> = %d")
writef(product(l), "<p>The <tt>product</tt> = %d")
write("<p><tt>head</tt>(<b>list</b>) -> ", 0) prnt(head(l)) -- this is the OE Core version
--------------------------------------------------------------------------------
include library/sequence.e -- for 'head_', 'last', 'init', 'tail'
--------------------------------------------------------------------------------
-- More output, written line-by-line for illustrative purposes, but also to
-- emphasise that 'write' can issue as many carriage-returns as needed by the
-- creole translator - the default for 'write' is one - but here, by using '0',
-- holding the line for the 'prnt' output, to emphasise that the result is
-- displayed on the same line as the prompt.
--------------------------------------------------------------------------------
write("<p><tt>last</tt>(<b>list</b>) -> ", 0) prnt(last(l))
write("<p><tt>init</tt>(<b>list</b>) -> ", 0) prnt(init(l))
write("<p><tt>tail</tt>(<b>list</b>) -> ", 0) prnt(tail(l))
write("<p><tt>head_</tt>(<b>list</b>) -> ", 0) prnt(head_(l)) -- this is the CANOE version
write("</body>")
--------------------------------------------------------------------------------
-- We have now completed our output, so we want to:
--
--* finish off
--* display our result, using the 'display' function
--
-- We can change the browser name, using an appropriate parameter value here)
--
-- The function closes the file and then opens a new browser tab,
-- containing the output in html style
--
-- The system may issue browser-related messages to the Terminal window
--
-- The file:
--
--* test.html
--
-- is left in the folder where the app is called.
--
-- This app continues to overwrite this file, so there is no especial need
-- to delete it each time.
--
-- They could be useful in the event of an error in the output, as it is
-- perfectly readable.
--------------------------------------------------------------------------------
display() -- a [string] parameter will change the browser used
--------------------------------------------------------------------------------
-- NB: STDERR is now clear for its proper purpose, as shown here
--------------------------------------------------------------------------------
include library/warn.e
warn(888)
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
