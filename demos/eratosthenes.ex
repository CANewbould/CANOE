--------------------------------------------------------------------------------
-- Test application: eratosthenes.ex
--------------------------------------------------------------------------------
--Version: 4.1.0.2
--Date: 2022.03.28
--Author: C A Newbould
--Status: Complete
--Changes:
--* modified to use ##range## in //sequence.e//
--------------------------------------------------------------------------------
-- Uses the default output mode - STDOUT
--------------------------------------------------------------------------------
-- Get the source
--------------------------------------------------------------------------------
include sequence.e -- for 'foldr','init','range','tail'
puts(1,"Integer limit? ") integer n = s2i(init(gets(0)))
--------------------------------------------------------------------------------
-- Start output
--------------------------------------------------------------------------------
include io.e -- for 'write','writel'
write("Primes up to this limit: ")
--------------------------------------------------------------------------------
-- Define the fold function
--------------------------------------------------------------------------------
function gt0(integer a, sequence b)
    return iif(a > 0,b&a,b)
end function
--------------------------------------------------------------------------------
-- Define the erato function
--------------------------------------------------------------------------------
include boolean.e -- for 'FALSE'
function erato(integer n) -- input: an integer n > 1
    sequence a = range(n)
    for i = 2 to floor(power(n, 0.5)) do
        if a[i] then for j = i*i to n by i do a[j] = FALSE end for end if
    end for
    return foldr(tail(a),"gt0")
end function
--------------------------------------------------------------------------------
-- Output result
--------------------------------------------------------------------------------
writel(erato(n))
display("Sieve of Eratosthenes")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--Version: 4.1.0.1
--Date: 2022.03.02
--Author: C A Newbould
--Status: Complete
--Changes:
--* copied and modified
--------------------------------------------------------------------------------
