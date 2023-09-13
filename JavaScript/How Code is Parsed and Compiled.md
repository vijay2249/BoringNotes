
[https://hackernoon.com/javascript-v8-engine-explained-3f940148d4ef](https://hackernoon.com/javascript-v8-engine-explained-3f940148d4ef)
[https://firefox-source-docs.mozilla.org/js/index.html](https://firefox-source-docs.mozilla.org/js/index.html)


The engines in web browser typically consists of two parts for JavaScript Parsing and Execution
1. Interpreter
	1. Initially when we load the script, we parse our script which basically means we load it and we then start execution
	2. The execution part is done by the interpreter
	3. The interpreter basically loads our script, reads it, it then translates it to byte code which is a bit easier to execute and then starts running our script
2. Compiler
	1. It is typically a just in time compiler

Now the interpreter does the job but by reading line by line which is not an optimised way of executing the code

Executing the machine code is faster compared to interpreter code, what compilers are in place for.

This interpreter hands over the bytecode to the compiler and so the compiler, whilst the interpreter already started execution of your script, now compiles the script to machine code

The compiler starts `compiling + executing` the compiled code `whilst the code is being read/executed`

Browser APIs
	Communication bridges between JavaScript and C++ Logic built into the browser

[[JavaScript/Inside JS Engine|Inside JS Engine]]
