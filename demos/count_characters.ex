--------------------------------------------------------------------------------
-- Test application: count_characters.ex
--------------------------------------------------------------------------------
--Version: 4.1.0.0
--Date: 2022.03.04
--Author: C A Newbould
--Status: Complete
--Changes:
--* copied from Rosetta
--------------------------------------------------------------------------------
-- Define the source
--------------------------------------------------------------------------------
constant source =
 "Not all that Mrs. Bennet, however, with the assistance of her five daughters,"
&" could ask on the subject, was sufficient to draw from her husband any"
&" satisfactory description of Mr. Bingley. They attacked him in various ways"
&" --with barefaced questions, ingenious suppositions, and distant surmises;"
&" but he eluded the skill of them all, and they were at last obliged to accept"
&" the second-hand intelligence of their neighbour, Lady Lucas."
&" Her report was highly favourable. Sir William had been delighted with him."
&" He was quite young, wonderfully handsome, extremely agreeable, and, to crown"
&" the whole, he meant to be at the next assembly with a large party."
&" Nothing could be more delightful! To be fond of dancing was a certain step"
&" towards falling in love; and very lively hopes of Mr. Bingley's heart were"
&" entertained."
--------------------------------------------------------------------------------
--Define output mode
--------------------------------------------------------------------------------
with define IUPWB
--------------------------------------------------------------------------------
-- Start output
--------------------------------------------------------------------------------
include io.e -- for 'writef','writefln','writeln'
writefln(source,"<h3>The source text:</h3><p>%s")
--------------------------------------------------------------------------------
-- fold function
--------------------------------------------------------------------------------
function count(integer i,sequence s)
    s[i] += 1
    return s
end function
--------------------------------------------------------------------------------
-- Generate results
--------------------------------------------------------------------------------
include sequence.e -- for 'foldr'
sequence counts = foldr(source,"count",repeat(0,127))
--------------------------------------------------------------------------------
-- fold function
--------------------------------------------------------------------------------
integer n = 0
function out(integer i,atom a)
    n += 1 -- position in sequence being mapped
    if i then writef(n,"<p>Character '<b>%s</b>':") writefln(i," count = %d") end if
    return a
end function
--------------------------------------------------------------------------------
-- Output results
--------------------------------------------------------------------------------
writeln("<h3>Character counts:</h3>")
foldr(counts,"out",0)
--------------------------------------------------------------------------------
display("This CANOE app counts the frequencies of characters in a section of 'Pride and Prejudice'")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
