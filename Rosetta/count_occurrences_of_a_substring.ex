--count_occurrences_of_a_substring.ex

include ../library/ints.e -- for 'ints'
include ../library/io.e -- for 'writef', 'writefln'
include ../library/sequence.e -- for 'findAll', 'map'
include ../library/string.e -- for 'string'
function matchAll(string s, string n)
    sequence res = EMPTY
    integer i = match(n, s)
    while i do
        res &= i
        i = match(n, s, i+1)
    end while
    return res
end function
function report(sequence h,sequence n)
    ints ns = matchAll(h,n)
    integer l = length(ns)
    switch l do
        case 0 then writeln("No matches")
        case else
            writef(l, "There are %d ")
            writef(n,"'%s' in ")
            writefln(h,"'%s'.")
    end switch
    return l
end function

writeln("This app counts the instances of sub-strings in a source\n")
report("the three truths","th")
report("ababababab","abab")
