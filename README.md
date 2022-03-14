# CANOE: C A Newbould's Open Euphoria offering

This project offers a personal view of how Open Euphoria (OE) can best be utilised to cover a wide range of programming requirements.

CANOE assumes a version of Open Euphoria not earlier than v4.0.5, although, in practice, the development has been made, and tested, using the64-bit version of OE4.1.0. Only the Core of the Interpreter is used; the contents of the *standard* libraries are never called upon. Instead, within its own library modules, CANOE supplies alternative functionality, loosely organised by Euphoria **type**s. A complete OE "system" is thus defined, albeit somewhat incomplete at present.

##Concepts

This derivation is based upon three notions which are, in my view, conceptualise an optimum approach to programming in Euphoria.

* Scope
* IO
* Expressions

Each is explained further below.

###Scope

The original (RDS) Euphoria offered just *local* and *global* scope. This approach can present problems when trying to develop a modular style of programming because a complete coding solution can "work" perfectly well without any of the associated modules being interpretable.

In producing Open Euphoria the hierarchy of local-export-public-global was developed to address this issue, which it undoubtedly does but at the expense of introducing more complexity. In the standard libraries, for example, *public* has replaced *global* universally, but it only can serve the same purpose of the keyword is also used along with *include* - a messy solution, in my view, and one which doesn't really clarify the essential uncertainty of the earlier approach: where does the accessibility of an element (routine or value) originate?

Consequently in CANOE I have voted for sole use of the *export* keyword for 'inheritance': you need to include a module explicitly in order to access the functionality in a module.

###IO (but mainly Output)

The de facto position of OE is that it is a terminal-based language: routines exist for keyboard input and screen output only, with a nominal option for separating results from warnings/errors, but one which, in practice, doesn't work effectively - some would argue that it doesn't work at all!

There is no "built-in", nor native, access to a graphical-user interface (GUI) without recourse to at least one C-language library. Nor is there any consideration of any other potential sources of output or markup opportunities.

In CANOE I have opted for a unified approach to all forms of output: a single set of output routines, with the option to display the results in a range of output contexts, including ones which a user might choose to add themselves.

###Expression-processing

Euphoria is classified as a procedural language, but its main mode of usage is as a data-manipulation engine, based on *variables*. I have nothing against this approach, per se, but prefer one which is based upon *expressions*, each of which is manipulated by *functions* into further expressions - essentially a "functional" approach to programming.

Thus CANOE places emphasis on functions, constants, list-processing and recursion over procedures, variables, loops and "half-hearted" *if*s.

## Modules

Realising these CANOE principles has been the main determinant in deciding how to organise the library of modules offered. The resolution is not unique, but constitutes a pragmatic solution.

Each module focusses on a single "context", but these vary between modules. Some are dedicated to a single *type*, whether explicitly, or implicitly, defined. Others embrace multiple types but cover a coherent set of circumstances, like file-handling or the C-language interface.

The distinct modules sit at the "top" level of the repository. A few principles governing the contents of these library modules:

* all routines are cast as **function**s, even if the return value is always incidental
* wherever possible/practical a specific function is defined *declaratively*
* each **function** is defined at the most general level that the author considers sensible
* use is made of OE's default parameter values, both to apply overloading and to shorten code calls
* use is made of "constructor"/"creator" functions to emphasise the nature of the return value
* typing is used but more as a grouping or signalling tool than for strict type-checking
* the use of variables is minimised and confined to local scope
* only **constants** and **function**s have any extra-module accessibility through *export* scope - *global* is used simply as a tag to signify OE built-ins
* thus "inheritance" from one type to another is implicit not explicit - the user needs to follow through to establish the reasonableness of application

A (growing) range of examples to illustrate the ideas within the CANOE approach are stored in the *demos* folder.

## Coding

When writing apps or further library modules using the CANOE approach the following considerations should be borne in mind:

* use **expression**s over **variable**s
* avoid the use of **loop**s
* avoid dangling **else**s
* adopt a list-comprehension perspective: in CANOE **map**s and **filter**s are both subsumed within the two forms of **fold**, although there is a separate versions of both **filter** and **map** provided for convenience; all of these should be used, whilst also exploiting **sequence** arithmetic
* consider the optimum Input/Output scenario - see below
* given the use of *export*, ensure that all necessary modules are *include*d in a calling module

## Input/Output

You can use the built-in I/O routines of OE in the normal way when using CANOE. CANOE. however, offers a range of universal output functions which differ from the standard Euphoria routines insofar as they all "store" cumulatively rather than output immediately. These routines are:

* write(object o)
* writef(object 0,sequence format)
* writeln(object o)
* writefln(object 0,sequence format)
* writel(sequence a,sequence format)

When adopting this approach the user can elect to direct the contents of the store to a range of output contexts, which currently are:

* the standard output screen
* an IUP web-browser tab

or a dialogue using
* IUP
* libui, or
* GTK

A user doesn't need to understand how any of these GUI toolkits work, nor are they required to do any coding in them. A general-purpose function (**display**) is called, which entitles the output. The output context is controlled using the *with define* keywords followed by a code - one of:

* STDOUT (the default)
* GTK
* IUP
* IUPWB
* UI

(Note that a non-STDOUT option can only be used if the appropriate shared library - as a minimum - and associated wrapper library are present on the calling Operating System.)

It is important to note that the keyword definition must precede the inclusion of the **io** module, in which the writing functions are declared and where the keyword is detected. If the declaration follows the inclusion the default always applies.

Where either the *GTK* or *IUPWB* option is selected the user can add markup code to the written output to improve its look and even add a style sheet for yet further elaboration.

All the examples in the *demos* folder are constructed using this alternative output strategy. Each illustration is thoroughly documented to outline the general strategy. A user can easily re-direct the output of any of these examples by modifying or adding a suitable keyword definition. (Note, however, that the more markup material sent to the web-browser the more editing is necessary to switch output mode.)

## Documentation

Each module, whether library or app, is self documented. Library modules have easily read comments which can be "translated" into an *html* file if required. A convention, somewhat influenced by Haskell, is used to symbolise what each **type** is and what each **function** does.

Aside from this embedded comment, the explicit CANOE code is laid out, using indentation, in a manner which clearly associates functions with types.

Application modules have extensive comment, especially in areas which may be less familiar to Euphoria programmers.

## Development

CANOE is very much a work-in-progress. Some library modules are intended but not yet created. Consequently functions may change homes or modules split into more detailed sub-modules.

## OOP and dot-notation

CANOE doesn't offer a route to Object-Oriented Programming (OOP) although a sister project (OE4OOP) does. The latter project adopts the styles and conventions of CANOE and so, one day, the two may be merged. (An OE4OOP 'object' is a **pointer**, which operates in a parallel fashion to a **type** in CANOE.)

CANOE, however, does, consciously, adopt an object-centred (OC) approach. By this is meant the focus on **type**s, their inter-relationships, the functions that operate on each type and how inheritance of these applies.

The main feature of OC is the relationship between a function and its primary argument's type. This enables such code to be written using dot notation, in the following manner.

The CANOE/OC code

`fnname(objectname[,arg1[...]])`

can be written as

`objectname.fnname([arg1[...]])`

and rapidly handled by a pre-processor, which translates and then runs the resulting CANOE code in the OE Interpreter.
