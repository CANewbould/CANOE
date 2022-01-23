--count_characters.ex

include ../library/io.e -- for 'writef', 'writefln', 'writeln'
writeln("This CANOE app counts the frequencies of characters in a source")
writeln("---------------------------------------------------------------") writeln()

constant source =
 "Not all that Mrs. Bennet, however, with the assistance of her five daughters,"
&"could ask on the subject, was sufficient to draw from her husband any"
&"satisfactory description of Mr. Bingley. They attacked him in various ways"
&"--with barefaced questions, ingenious suppositions, and distant surmises;"
&"but he eluded the skill of them all, and they were at last obliged to accept"
&"the second-hand intelligence of their neighbour, Lady Lucas."
&"Her report was highly favourable. Sir William had been delighted with him."
&"He was quite young, wonderfully handsome, extremely agreeable, and, to crown"
&"the whole, he meant to be at the next assembly with a large party."
&"Nothing could be more delightful! To be fond of dancing was a certain step"
&"towards falling in love; and very lively hopes of Mr. Bingley's heart were"
&"entertained."

include ../library/ints.e -- for 'ints'
ints counts = repeat(0,127)
function count(integer i)
    counts[i] += 1
    return 1 -- not used
end function
include ../library/sequence.e -- for 'map_'
map_(source,"count")

integer n = 0
function out(integer i)
    n += 1 -- position in sequence being mapped
    if i then writef(n,"Character '%s':") writefln(i," count = %d") end if
    return n -- not used   
end function
map_(counts,"out")