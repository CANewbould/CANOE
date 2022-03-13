--------------------------------------------------------------------------------
-- Test application: simple_window.ex
--------------------------------------------------------------------------------
--Version: 4.1.0.1
--Date: 2022.03.13
--Author: C A Newbould
--Status: Complete
--Changes:
--* tested ##Open## call
--------------------------------------------------------------------------------
include libiup.e
--------------------------------------------------------------------------------
-- Define callback
--------------------------------------------------------------------------------
function click_cb(atom self)
    clicks += 1
    attrib(lbl,"TITLE",sprintf("clicked %d times",{clicks}))
    return IUP_DEFAULT
end function
--------------------------------------------------------------------------------
-- Main run
--------------------------------------------------------------------------------
if Open() = IUP_ERROR then abort(0) end if
    integer clicks = 0
    constant lbl = Label("There have been no clicks yet")
    constant btn = Button("Click me")
    setcallback(btn, "ACTION", Icallback("click_cb"))
    constant vbox = Vbox({lbl, Hbox({Fill(),btn,Fill()})})
    constant dlg = New(Dialog(vbox),"DIALOGFRAME=YES,MARGIN=10x10, GAP=10, RASTERSIZE=400x0")
    attrib(dlg, "TITLE", "Simple windowed application")
    show(dlg)
    Loop()
Close()
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--Version: 4.1.0.0
--Date: 2022.03.09
--Author: C A Newbould
--Status: Complete
--Changes:
--* created
--------------------------------------------------------------------------------
