--------------------------------------------------------------------------------
-- Test application: primes.ex
--------------------------------------------------------------------------------
--Version: 4.1.0.1
--Date: 2022.03.12
--Author: C A Newbould
--Status: Complete
--Changes:
--* changed output mode
--* modified to use ##input## instead of ##gets##
--* revised output - for longer lists
--------------------------------------------------------------------------------
-- Get the source
--------------------------------------------------------------------------------
include sequence.e -- for 'foldr','s2i'
include input.e -- for 'input'
constant n = s2i(input("Integer limit?"))
--------------------------------------------------------------------------------
-- Select the output mode
--------------------------------------------------------------------------------
with define IUP
--------------------------------------------------------------------------------
-- Start output
--------------------------------------------------------------------------------
include io.e -- for 'writefln','writel'
writefln(n,"Primes up to %d:")
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
writel(foldr(range(n,3),"prime",{2}))
display("Prime Numbers")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--Version: 4.1.0.0
--Date: 2022.03.03
--Author: C A Newbould
--Status: Complete
--Changes:
--* created
--------------------------------------------------------------------------------