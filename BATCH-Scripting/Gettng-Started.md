

## Introduction

Series of command that is executed by CLI, extension is ".bat" or ".cmd"


`echo` -> used to output some data to the terminal/user
`pause` -> will pause the process for user input and then after some input then window closes.


Command Echoing -> all the commands executed or written in a file are displayed in the terminal and are executed one by one with output. By default it is on
To turn off this feature use `@Echo off` or `Echo off`

Now if the feature is turned off you can only see the output of the command execution...

`@Echo off` -> will not display the "Echo off" output also
`Echo off` -> it will display "Echo off" first then the output of the commands


`VER` -> Displays the os version

`CD` -> navigate to working directory, if no extra arguments are given then it will print the current working directory path from root folder.

`CHOICE` -> will prompt the user to select an option from the list of options using single character
If no input is given, then it will consider the default value

`CHOICE /C <OptionsWithoutAnySpaces>`

Ex: <code>choice /c ABCD /m "Displaying this message and user will have four options to select from A,B,C,D"</code>


`Date` -> display current system date
`Time` -> display current system time

use <code>%variable%</code> syntax to echo variables

`TASKLIST` -> will list a currently running process on the system that was executed on, it also displays the PID, Memory Usage, Name and Session Number information also for each process

`@REM` -> comments in a batch script file

`COMP` -> compare two files
<code> comp file1 file2</code>

`COPY` -> <code> copy [source] [destination]</code>
copy the contents of source to destination, if no destination path is mentioned then the current working directory is considered as destination
This will copy only files but not the folders/directories, for this we can use `XCOPY` command

`XCOPY` -> <code>xcopy [source] [destination] /S</code>
copies all the files and folders except sub directories.
/E -> copies empty directories also to destination folder

`MOVE` -> <code>move [source] [destination]</code>
move content from source to destination, can be used to rename files/folders

`ATTRIB` -> Displays or changes file attributes.
Usage:
	ATTRIB \[+R | -R] \[+A | -A] \[+S | -S] \[+H | -H] \[+O | -O] \[+I | -I] \[+X | -X] \[+P | -P] \[+U | -U]
       \[drive:]\[path]\[filename] \[/S \[/D]] \[/L]

  \+ Sets an attribute.
  \-  Clears an attribute.
  R   Read-only file attribute.
  A   Archive file attribute.
  S   System file attribute.
  H   Hidden file attribute.
  O   Offline attribute.
  I   Not content indexed file attribute.
  X   No scrub file attribute.
  V   Integrity attribute.
  P   Pinned attribute.
  U   Unpinned attribute.
  B   SMR Blob attribute.
  \[drive:]\[path]\[filename]
      Specifies a file or files for attrib to process.
  /S  Processes matching files in the current folder
      and all subfolders.
  /D  Processes folders as well.
  /L  Work on the attributes of the Symbolic Link versus
      the target of the Symbolic Link



## Special Characters

`@` -> lets batch processor know to be less verbose
`::` -> comments in batch file
`>` -> redirects the command output to mentioned next action, might to send output to terminal or to another command or just store it in another file, this will overwrite the already present data that was present in file
`>>` -> appends the output to already present data in the file


We can capture the command line arguments using <code>%\[number]</code>

```bash
echo enter 2 arguments
echo %1
echo %2
```

<code>test.bat hi MOM</code> -> this outputs the arguments "hi" and "MOM" to console and they are retrieved by their position

`SET` -> <code>set [key]=[value]</code>
define variables using this keyword
variable names are not case sensitive
```batch
set str='Hi MOM' :: str is variable name and "Hi MOM" is the content of variable
set abl = another one :: "abl " is the variable name and " another one " is the content of the variable
set /A number=20 :: the variable holds the numeric value, any fraction value will be rounded to nearest integer
set /P userInput="Enter input" :: asks user for input and stores it in this variable
```

By default all variables are global variables, any variables that are defined between `SETLOCAL` and `ENDLOCAL` are considered local scoped variables


```batch
set gloablVar="Global"

setlocal

set localVar='local'
echo %localVar%

endlocal

echo %globalVar%
```

Environment variables are available globally and can be directly accessed by %envVariableName%

- %var% -> this is instruction as get the var value at the compile time
- !var! -> this is instruction as get the var value at the run time