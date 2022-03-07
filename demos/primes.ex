--------------------------------------------------------------------------------
-- Test application: primes.ex
--------------------------------------------------------------------------------
--Version: 4.1.0.0
--Date: 2022.03.03
--Author: C A Newbould
--Status: Complete
--Changes:
--* created
--------------------------------------------------------------------------------
-- Uses the default output mode - STDOUT
--------------------------------------------------------------------------------
-- Get the source
--------------------------------------------------------------------------------
include sequence.e -- for 'foldr','init'
puts(1,"Integer limit? ") integer n = s2i(init(gets(0)))
--------------------------------------------------------------------------------
-- Start output
--------------------------------------------------------------------------------
include io.e -- for 'write','writel'
write("Primes up to this limit: ")
--------------------------------------------------------------------------------
-- Define the fold function
--------------------------------------------------------------------------------
include boolean.e -- for 'iif'
function prime(integer a, sequence b)
    return iif(not find(0,remainder(a,b)),b&a,b)
end function
--------------------------------------------------------------------------------
-- Output result
--------------------------------------------------------------------------------
include ints.e -- for 'Ints'
writel(foldr(Ints(n,3),"prime",{2}))
display("Prime Numbers")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
