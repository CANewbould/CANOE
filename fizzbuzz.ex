-- fizzbuzz.ex

-- Example from the Open Euphoria website
-- Using CANOE libraries
-- modified to work on any pair of integers

include library/boolean.e -- for 'iif'
include library/io.e -- for 'writef','writeln'
include library/ints.e -- for 'ints','Ints'
include library/list.e -- for 'product'
include library/sequence.e -- for 'map','map_'
include library/string.e -- for 'string'

constant i = Ints(1,100)
writeln("Simple solution")
map(i,"writef","%d ") writeln()

writeln("Fizz solution")
function fizz(integer i,integer j)
    return iif(remainder(i,j)=0,"fizz",sprintf("%d",i))
end function
map(map(i,"fizz",3),"writef","%s ") writeln()

writeln("Buzz solution")
function fizzbuzz(integer i,ints j)
    if remainder(i,product(j))=0 then return "fizzbuzz"
    elsif remainder(i,j[1])=0 then return "fizz"
    elsif remainder(i,j[2])=0 then return "buzz"
    else return sprintf("%d",i)
    end if
end function
map(map(i,"fizzbuzz",{3,5}),"writef","%s ") writeln()
