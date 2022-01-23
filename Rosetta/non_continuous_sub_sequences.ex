--non_continuous_sub_sequences.ex

include ../library/boolean.e -- for 'boolean', 'FALSE', 'iif', 'TRUE'
include ../library/ints.e -- for 'Ints'
include ../library/io.e -- for 'write', 'writefln', 'writeln'
include ../library/sequence.e -- for 'EMPTY'
include ../library/string.e -- for 'string'
boolean countonly = FALSE
integer count = 0

-- 'copied' from 'phix' solution
procedure ncs(sequence rest, integer ri=0, sequence taken={}, boolean contig=FALSE, boolean gap=FALSE)
    if ri>=length(rest) then
        if contig then
            if countonly then
                count += 1
            else
                ?taken
            end if
        end if
    else
        ri += 1
        ncs(rest,ri,taken&rest[ri],gap,gap)
        ncs(rest,ri,taken,contig,length(taken)!=0)
    end if
end procedure
 
write("ncs([1..3]) -> ") ncs(Ints(1,3))
writeln("ncs([1..4]) -> ") ncs(Ints(1,4))
countonly = TRUE
atom t0 = time()
sequence s = EMPTY
for i=1 to 20 do
    count = 0
    ncs(Ints(1,i))
    s = append(s,count)
end for
writefln(time()-t0,"Time taken: %g seconds")
writeln("** Result from looping 20 times **")
?s

-- Java equivalent
procedure seqR(string s, string c="", integer i=0, integer added=0)
    if i = length(s) then
        if length(trim(c,BOTH)) > added then
            writefln(c,"'%s'")
        end if
    else
        seqR(s,c&s[i+1],i+1,added+1) -- s is not zero-based
        seqR(s,c&' ',i+1,added)
    end if
end procedure

writeln("*** Copy of Java solution ***")
writeln("for [1..3]")
seqR("123")
writeln("for [1..4]")
seqR("1234")
writeln("for [1..5]")
seqR("12345")
