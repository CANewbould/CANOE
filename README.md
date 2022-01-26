# CANOE: C A Newbould's Open Euphoria offering

This project offers a personal view of how Open Euphoria can best be utilised to cover a wide range of programming requirements.

CANOE assumes a version of Open Euphoria not earlier than v4.0.5. Only the Core of that interpreter is used; the contents of the *include* folder are never called upon. Instead, within its *library* folder, CANOE supplies alternative modules organised by Euphoria **type**s and not by functionality (except for elements of the *io* library). A complete OE "system" is thus provided, albeit somewhat incomplete at present.

## Modules
The top-level folder contains a range of examples to illustrate the ideas within the CANOE approach. The *library* folder contains small and distinct modules which provide the guts of the approach. The principles governing these library modules are:

* each module concentrates on a single **type**, or, on the special case of Input/Output
* routines are defined which operate primarily on that type (ie the first argument is of the specific type)
* all routines are cast as **function**s, with void functions substituting for "procedures"
* in most cases a specific function is defined *declaratively*
* use is made of OE's default parameter values, both to apply overloading and to shorten code calls
* a **function** is defined at the most general level that the author considers sensible
* use is made of "constructor"/"creator" functions whenever it seems sensible
* the use of variables is minimised and confined to local scope
* **constants** and **function**s either have local or *export* scope - no use is made of *public* nor of *global*, although that tag is used to signify OE's built-ins in some of the documentation
* as a result "inheritance" from type to type is implicit not explicit - the user needs to follow through to establish the reasonableness of application

## Coding

When writing apps or further library modules using the CANOE approach the following considerations should be borne in mind:

* use **expression**s over **variable**s
* avoid the use of **loop**s
* avoid dangling **else**s
* adopt a list-comprehension perspective: eg via **map**s, **filter**s and **fold**s, or by exploiting **sequence** arithmetic
* consider the optimum Input/Output scenario - see below
* given the use of *export*, ensure that all necessary modules are *include*d in the calling module

## Input/Output

You can use the built-in I/O routines of OE in the normal way when using CANOE. CANOE. however, offers alternatives to this terminal-based platform. The IUP GUI interface affords both the means of collecting user input and displaying output, whether through the predefined dialogues or via purpose-built **dialog**s within the IUP framework.

The project also explores using a pre-set IUP **dialog**, along with a small set of converted built-in routines, as an alternative form of output.

(Note that CANOE's version of the IUP wrapper uses the short-form naming convention - all without the leading 'IUP'.)

In similar vein CANOE also offers two routes to using the tab of a web browser as the Output "device":

* using *creole*, the markup language currently used for OE documentation, as an intermediary
* using *html* code directly, even to the extent of embedding simple *Javascript* code within

These two also use variants of the built-in routines to create the output; the process is surprisingly close to the conventional terminal-based approach, so a new user can quickly make the adaptation.

As an alternative to using a browser tab you can use instead a simple IUP dialog with a WebBrowser widget embedded within, as the output "screen" and largely avoid the use of the Terminal Window as the Standard Output Device.

## Documentation

Each module, whether library or app, is self documented. Library modules have easily read comments which can be "translated" into an *html* file if required. A convention, somewhat influenced by Haskell, is used to symbolise what each **type** is and what each **function** does.

Aside from this embedded comment, the explicit CANOE code is laid out, using indentation, in a manner which clearly associates functions with types. Although most library modules concentrate on a single type definition, the principle can be adopted, with enhanced clarity, if more than one type is defined within a module.

Application modules have extensive comment, especially in areas which may be less familiar to Euphoria programmers.

## Development

CANOE is very much a work-in-progress. Some library modules currently contain no code; they are there awaiting future additions as they arise. Equally new modules will be needed and it is possible that functions may change homes or modules split into more detailed sub-modules.

## OOP and dot-notation

CANOE doesn't offer a route to Object-Oriented Programming (OOP) although a sister project (OE4OOP) does. The latter project adopts the styles and conventions of CANOE and so, one day, the two may be merged. (An OE4OOP 'object' is a **pointer**, which operates in a parallel fashion to a **type** in CANOE.)

CANOE, however, does, consciously, adopt an object-centred (OC) approach. By this is meant the focus on **type**s, their inter-relationships, the functions that operate on each type and how inheritance of these applies.

The main feature of OC is the relationship between a function and its primary argument's type. This enables such code to be written using dot notation, in the following manner.

The CANOE/OC code

`fnname(objectname[,arg1[...]])`

can be written as

`objectname.fnname([arg1[...]])`

and rapidly handled by a pre-processor, which translates and then runs the resulting CANOE code in the OE Interpreter.
