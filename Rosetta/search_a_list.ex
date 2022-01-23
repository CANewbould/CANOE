-- search_a_list.ex

include ../library/io.e -- for 'writef', 'writefln'
include ../library/ints.e -- for 'ints'
include ../library/sequence.e -- for 'findAll', 'map_'
include ../library/warn.e -- for 'warn'

constant FIND_EXCEPTION = "!!! Find Exception !!!"
function report(sequence h)
    ints ns = findAll(h,"needle")
    switch length(ns) do
        case 0 then warn(FIND_EXCEPTION)
        case 1 then writefln(head_(ns), "Only needle at index %d.")
        case else
            writef(head_(ns), "First needle at index %d")
            map(ns[2..$-1],"writef","; another at %d") 
            writefln(last(ns), "; last needle at index %d.")
    end switch
    return ns
end function

-- data
constant haystacks =
{
 {"needle", "needle", "noodle", "node", "need", "needle  ", "needle"}
,{"spoon", "fork", "hay", "knife", "needle", "barn", "etcetera", "more hay", "needle", "a cow", "farmer", "needle", "dirt"}
,{"needle"}
,{"no", "need le s", "in", "this", "haystack"}
,{"knee", "needle", "dull", "needle"}
,{}
}
-- execution
map_(haystacks,"report") -- short form of 'map'
