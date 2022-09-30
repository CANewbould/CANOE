--------------------------------------------------------------------------------
-- Test application: iupwb.ex
--------------------------------------------------------------------------------
with define IUPWB
--------------------------------------------------------------------------------
include io.e -- for 'writel','writeln'
--------------------------------------------------------------------------------
-- some output
--------------------------------------------------------------------------------
writeln("<h1>Testing</h1>")
writeln("<p>This is line 1")
writeln("<p>This is line 1 <font color=red><big>again</big></font>")
--------------------------------------------------------------------------------
-- map result
--------------------------------------------------------------------------------
include sequence.e -- for 'range'
write("<p>")
writel(range(10,2),"This is line <b>%d</b>")
--------------------------------------------------------------------------------
display("Testing IUP WebBrowser")
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------