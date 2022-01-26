-- eratosthenes.ex
include library/boolean.e -- for 'FALSE'
--include library/io.e -- for 'write','writef','writefln','writeln'
include library/creole.e -- for 'write', 'writef'
include library/ints.e -- for 'ints','Ints'
include library/sequence.e -- for 'filter','init','map','tail'
include library/string.e

function gt(integer a, integer b) return a > b end function

function erato(integer n) -- input: an integer n > 1
    ints a = Ints(1, n)
    for i = 2 to floor(power(n, 0.5)) do
        if a[i] then for j = i*i to n by i do a[j] = FALSE end for end if
    end for
    return filter(tail(a),"gt",0)
end function

procedure main(string title)
    writef(title,"=%s\n\n")
    puts(1,"Integer limit? ") integer n = s2i(init(gets(0)))
    writef(n,"==Primes up to %d\n\n")
    map(init(erato(n)),"writef","%d, ") writef(last(erato(n)),"%d")
    display()
end procedure
main("Sieve of Eratosthenes")
