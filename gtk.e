--------------------------------------------------------------------------------
-- Library: gtk.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria io support library
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.02.28
-- Status: complete
-- Changes:
--* created
--
--==Open Euphoria extension library: eugtk for io
--
-- This library contains a basic gtk window, within which is a label object
-- used for displaying the output.
--
-- It has one routine.
--
--==Interface
--
--*/
--------------------------------------------------------------------------------
include GtkEngine.e
--------------------------------------------------------------------------------
--/*
--===Routines
--*/
--------------------------------------------------------------------------------
export function out(sequence txt, sequence ti)
    atom d = create(GtkWindow,"size=500x300,$destroy=Quit")
    set(d,"title",ti)
    atom panel = create(GtkBox,"orientation=HORIZONTAL")
    atom t = create(GtkLabel)--,txt)
    set(t,"markup",txt)
    gtk:add(d,panel)
    gtk:add(panel,t)
    show_all(d)
    main()
    return 0
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
