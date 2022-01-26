-- fizzbuzz.ex

-- Example from the Open Euphoria website
-- Using CANOE libraries
-- modified to work on any pair of integers

include library/boolean.e -- for 'iif'
include library/ints.e -- for 'ints','Ints'
include library/list.e -- for 'product'
include library/sequence.e -- for 'map','map_'
include library/string.e -- for 'string'
include library/creole.e -- for 'display','write','writef'

constant i = Ints(1,100)
write("=Fizz/buzz test program")
write("==Simple solution")
map(i[1..20],"writef","%d ") write()
map(i[21..40],"writef","%d ") write()
map(i[41..60],"writef","%d ") write()
map(i[61..80],"writef","%d ") write()
map(i[81..100],"writef","%d ") write()

write("==Fizz solution")
function fizz(integer i,integer j)
    return iif(remainder(i,j)=0,"fizz",sprintf("%d",i))
end function
map(map(i[1..20],"fizz",3),"writef","%s ") write()
map(map(i[21..40],"fizz",3),"writef","%s ") write()
map(map(i[41..60],"fizz",3),"writef","%s ") write()
map(map(i[61..80],"fizz",3),"writef","%s ") write()
map(map(i[81..100],"fizz",3),"writef","%s ") write()

write("==Buzz solution")
function fizzbuzz(integer i,ints j)
    if remainder(i,product(j))=0 then return "fizzbuzz"
    elsif remainder(i,j[1])=0 then return "fizz"
    elsif remainder(i,j[2])=0 then return "buzz"
    else return sprintf("%d",i)
    end if
end function
map(map(i[1..18],"fizzbuzz",{3,5}),"writef","%s ") write()
map(map(i[19..36],"fizzbuzz",{3,5}),"writef","%s ") write()
map(map(i[37..48],"fizzbuzz",{3,5}),"writef","%s ") write()
map(map(i[49..64],"fizzbuzz",{3,5}),"writef","%s ") write()
map(map(i[65..80],"fizzbuzz",{3,5}),"writef","%s ") write()
map(map(i[81..96],"fizzbuzz",{3,5}),"writef","%s ") write()
map(map(i[97..100],"fizzbuzz",{3,5}),"writef","%s ") write()

display()