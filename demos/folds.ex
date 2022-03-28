--------------------------------------------------------------------------------
-- Test application: folds.ex
--------------------------------------------------------------------------------
--Version: 4.1.0.2
--Date: 2022.03.28
--Author: C A Newbould
--Status: Complete
--Changes:
--* added annotations to functions
--* changed ##foldr## to ##foldl" for testing
--* small change to the title
--* added an example of OE sequence arithmetic
--------------------------------------------------------------------------------
-- Determine output mode
--------------------------------------------------------------------------------
with define IUPWB
--------------------------------------------------------------------------------
-- The source
--------------------------------------------------------------------------------
include sequence.e -- for 'range'
sequence list = range(10)
--------------------------------------------------------------------------------
-- Start output
--------------------------------------------------------------------------------
include io.e -- for 'writefln','write','writel','writeln'
write("<h1>The list</h1>")
writel(list)
--------------------------------------------------------------------------------
-- Define the fold,map and filter functions
--------------------------------------------------------------------------------
function sq(atom a,sequence b) -- a->s->s
    return b&a*a
end function
--------------------------------------------------------------------------------
function add(atom a, atom b) -- a->a->a
    return b+a
end function
include boolean.e
--------------------------------------------------------------------------------
function even(atom a,sequence b) -- a->s->s
    return iif(remainder(a,2),b,b&a)
end function
--------------------------------------------------------------------------------
function gt(atom a,atom b) -- a->a->b
    return a>b
end function
--------------------------------------------------------------------------------
write("<h2>Squares</h2>")
--------------------------------------------------------------------------------
write("foldr(list,\"sq\")-> ")
writel(foldr(list,"sq"))
--------------------------------------------------------------------------------
write("<h2>Sum of the elements</h2>")
writefln(foldl(list,"add",0),"foldl(list,\"add\",0)-> %d")
--------------------------------------------------------------------------------
writeln("<h2>The even elements</h2>")
write("foldr(list,\"even\")-> ")
writel(foldr(list,"even"))
writeln("<h2>The elements > 3</h2><p>filter(list,\"gt\",3)->")
writel(filter(list,"gt",3))
--------------------------------------------------------------------------------
function positive(integer a,sequence b)
    return iif(a,b&a,b)
end function
--------------------------------------------------------------------------------
write("<p>Another way:\nfoldr((list>3)*list,\"positive\")-> ")
writel(foldr((list>3)*list,"positive"))
--------------------------------------------------------------------------------
display("Sequences: Showing how folds do maps and filters, too!")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--Version: 4.1.0.1
--Date: 2022.03.09
--Author: C A Newbould
--Status: Complete
--Changes:
--* added ##filter## test
--------------------------------------------------------------------------------
--Version: 4.1.0.0
--Date: 2022.03.02
--Author: C A Newbould
--Status: Complete
--Changes:
--* created
--------------------------------------------------------------------------------
