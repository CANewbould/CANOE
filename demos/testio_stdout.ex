--------------------------------------------------------------------------------
-- Test application: testio_stdout.ex
--------------------------------------------------------------------------------
-- default so no local define needed
--------------------------------------------------------------------------------
include io.e -- for 'writel','writeln'
--------------------------------------------------------------------------------
-- some output
--------------------------------------------------------------------------------
writeln("This is line 1")
writeln("This is line 1 again")
--------------------------------------------------------------------------------
-- map result
--------------------------------------------------------------------------------
include sequence.e -- for 'range'
writel(range(10,2),"This is line %d")
--------------------------------------------------------------------------------
display("Testing")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
