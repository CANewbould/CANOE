--------------------------------------------------------------------------------
-- Library: file.e
--------------------------------------------------------------------------------
--/*
--
--= Open Euphoria file-based library
-- Version: 4.1.0.0
-- Author: C A Newbould
-- Date: 2022.03.03
-- Status: complete
-- Changes:
--* created
--* **filehandle** defined
--* ##File## defined
--* ##fread## defined
--* ##fwrite## defined
--* ##fseek## defined
--* ##fwhere## defined
--* ##flush## defined
--* ##getb## defined
--* added documentation entries for the built-ins
--* ##flines## defined
--
--==Open Euphoria extension library: file
--
-- This library contains material for accessing files.
--
--==Interface
--
--===Includes
--*/
--------------------------------------------------------------------------------
include boolean.e -- for 'FALSE','TRUE'
include sequence.e -- for 'init','perform'
--------------------------------------------------------------------------------
--/*
--===Type: filehandle
--*/
--------------------------------------------------------------------------------
export type filehandle(integer i) -- i->i
    return i=-1 or i>=3
    end type
    export function File(sequence s,sequence m) -- [c]->[c]->i
        return open(s,m)
    end function
    --<eucode>global function close(filehandle f) -- i->void</eucode>
    function gets_(filehandle f)
        object o = gets(f)
        return iif(sequence(o),init(o),o)
    end function
    constant EOF=-1
    export function flines(filehandle f) -- i->[[c]]
        return perform("gets_",f,EOF)
    end function
    constant M_FLUSH = 60
    export function flush(filehandle f) --i->b
        machine_proc(M_FLUSH, f)
        return TRUE
    end function
    function getc_(filehandle f)
        return getc(f)
    end function
    export function fread(filehandle f) -- i->[c]
        return perform("getc_",f,EOF)
    end function
    enum M_SEEK = 19, M_WHERE
    export function fseek(filehandle f,integer i) -- i->i->b
        return not machine_func(M_SEEK, {f, i})
    end function
    export function fwhere(filehandle f) -- i->i
        return machine_func(M_WHERE, f)
    end function
    export function fwrite(sequence s,filehandle f) -- [c]->i->b
        if f != -1 then
            puts(f,s)
            return TRUE
        else return FALSE
        end if
    end function
    export function getb(filehandle f,integer i) -- i->i->[i]
        sequence s = {}
        if f != -1 then
            integer c = getc(f), n = 1
            while n<=i and c!=-1 do
                s&=c
                c=getc(f)
                n+=1
            end while
        end if
        return s
    end function
    --<eucode>global function getc(filehandle f) -- i->i</eucode>
    --<eucode>global function gets(filehandle f) -- i->[c]</eucode>
    --<eucode>global function open(sequence s,sequence m) -- [c]->[c]->i</eucode>
--------------------------------------------------------------------------------
-- Previous versions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
