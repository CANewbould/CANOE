--------------------------------------------------------------------------------
-- io.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria IO library
--
--* Version: 4.0.5.5
--* Author: C A Newbould
--* Date: 2022.01.02
--* Status: incomplete
--* Changes:
--** modified layout
--
--== Library Interface
--
--=== Required modules
--
--*/
--------------------------------------------------------------------------------
include string.e -- for 'string'
include boolean.e -- for 'FALSE', 'iif', 'TRUE'
include char.e -- for 'char'
include sequence.e -- for 'apply', 'map_'
--------------------------------------------------------------------------------
--/*
--=== Constants
--*/
--------------------------------------------------------------------------------
public constant EOF = -1
constant EMPTY = {}
constant EOL = '\n'
enum KEYBOARD = 0, SCREEN
enum M_SEEK = 19, M_WHERE
constant UNSET = -1
constant VOID = 0
--------------------------------------------------------------------------------
type fileposition(integer this) -- (i) -> p
    return this >= 0 or this = EOF
    end type
--------------------------------------------------------------------------------
function fseek(filehandle fh, fileposition fp) -- (f -> i) -> b
    return not machine_func(M_SEEK, {fh, fp})
end function
--------------------------------------------------------------------------------
function fwhere(filehandle fh) -- :: f -> i
    return machine_func(M_WHERE, fh)
end function
--------------------------------------------------------------------------------
export type filehandle(integer this) -- (i) -> f
    return this = UNSET or this > 2
    end type
    export function flength(filehandle fh) -- (f) -> i
        if fseek(fh, 0) -- successful move to start of file
        then return iif(fseek(fh, EOF), fwhere(fh), 0) -- len | 0
        else return 0
        end if
    end function
    export function flines(filehandle fh) -- (f) -> [[c]]
        if fseek(fh, 0) -- successfully back to start of file
        then return apply("getString", fh, EOF)
        else return EMPTY
        end if
    end function
    export function fread(filehandle fh) -- (f) -> [c]
        if fseek(fh, 0) -- successfully back to start of file
        then return apply("getCh", fh, EOF)
        else return EMPTY
        end if
    end function
    export function getCh(filehandle this) -- (f) -> c
        return getc(this)
    end function
    export function getString(filehandle this) -- (f) -> [c]
        object o = gets(this)
        if atom(o) then return o
        else return o[1..$-1]
        end if
    end function
--------------------------------------------------------------------------------
--/*
--===Other IO routines
--*/
--------------------------------------------------------------------------------
export function getPromptedChar(string prompt) -- ([c]) -> c
    write(prompt & ": ")
    sequence s = gets(KEYBOARD)
    return s[1] -- needed to stop the trailing EOL being recycled
    end function
--------------------------------------------------------------------------------
export function put(string this) -- ([c]) -> IO
    writeln(this)
    return TRUE
end function
--------------------------------------------------------------------------------
export function write(object this = "") -- (o) -> IO
    if atom(this) then
        if char(this) then puts(SCREEN, this)
        else return VOID
        end if
    else -- sequence
        if string(this) then puts(SCREEN, this)
        else ?this
        end if
    end if
    return VOID
end function
--------------------------------------------------------------------------------
export function writef(object this, string format) -- (o -> [c]) -> IO
    printf(SCREEN, format, {this})
    return VOID
end function
--------------------------------------------------------------------------------
export function writefln(object this, string format) -- (o -> [c]) -> IO
    printf(SCREEN, format & EOL, {this})
    return VOID
end function
--------------------------------------------------------------------------------
export function writeln(object this = "") -- (o) -> IO
    write(this)
    puts(SCREEN, EOL)
    return VOID
end function
--------------------------------------------------------------------------------
export function writeLoop(sequence this) -- ([[c]]) -> IO
    map_("put", this)
    return VOID
end function
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--* Version: 4.0.5.4
--* Author: C A Newbould
--* Date: 2021.12.09
--* Status: incomplete
--* Changes:
--** ##writef## re-defined as a function, so can be used in list-comprehensions
--** ##writefln## re-defined as a function, so can be used in list-comprehensions
--** ##write## re-defined as a function, so can be used in list-comprehensions
--** ##writeln## re-defined as a function, so can be used in list-comprehensions
--** ##writeLoop## re-defined as a function, so can be used in list-comprehensions
--** VOID defined locally
--------------------------------------------------------------------------------
--* Version: 4.0.5.3
--* Author: C A Newbould
--* Date: 2020.06.26
--* Status: incomplete
--* Changes:
--** ##fread## defined
--** //EOF// defined
--** **filehandle** defined
--** ##flength## defined
--------------------------------------------------------------------------------
--* Version: 4.0.5.2
--* Author: C A Newbould
--* Date: 2020.06.21
--* Status: incomplete
--* Changes:
--** ##writeLoop## modified
--------------------------------------------------------------------------------
--* Version: 4.0.5.1
--* Author: C A Newbould
--* Date: 2020.06.18
--* Status: incomplete
--* Changes:
--** ##writeLoop## defined
--** ##write## extended
--** ##writeln## re-defined
--------------------------------------------------------------------------------
--* Version: 4.0.5.0
--* Author: C A Newbould
--* Date: 2020.06.13
--* Status: incomplete
--* Changes: created
--------------------------------------------------------------------------------
