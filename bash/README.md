Bash -> bourne again shell

- a shell lang , easy commands

default shell scripting lang for linux 
supports wsl.

## basic linux cmds-
~ echo Hello      ## print statement
~ vim textfile.txt     ## opens vim editor with the file
^C        ## to exit
~ cat textfile.txt     ## returns the output of the file
~ ls        ## list the files 
~ pwd       ## current working directory

## bash scripting
~ vim shelltest.sh
~ bash shelltest.sh    ## output hello world
~ echo $SHELL       ## output /bin/bash
~ ./sheltest.sh     ## Hello world

if you see -rw-r--r-- when doing ls -l that means persimission restriction for solving that issue 
what you can do is -> chmod u+x filename

## variables

it is used to store and manage data that can be reused, modified, and passed around in the script,

for eg.1 here we will use it to save filepath eg, ~ cp /my/location/from /my/location/to  
this is path is very long to avoid that we can use variables
MY_LOCATION_FROM = /my/location/from
MY_LOCATION_TO = /my/location/to
therefore updated cmd for file path will be
~  cp $MY_LOCATION_FROM $MY_LOCATION_TO

eg.2  name="Alice"
echo "Hello, $name!"

they have 1. reusablitiy, 2. maintainability 3. dynamic behaviour 4. script configuration  6. readibility 6. parameterization

## postional arguments

Positional arguments are a way to pass values to a Bash script when it is run from the command line. These values are accessed using special variables like $1, $2, $3, etc.

eg. #!/bin/bash

echo "First argument: $1"
echo "Second argument: $2"

if the script is run like this ./myscript.sh Alice 42
output -> First argument: Alice
Second argument: 42

SPECIAL POSITIONAL VARIABLES
| Variable     | Meaning                                             |
| ------------ | --------------------------------------------------- |
| `$0`         | The name of the script                              |
| `$1` to `$9` | The first to ninth argument                         |
| `${10}`      | The tenth argument (needs curly braces)             |
| `$#`         | Number of arguments passed                          |
| `$@`         | All arguments as separate words                     |
| `$*`         | All arguments as a single word                      |
| `"$@"`       | Preserves each argument as a separate quoted string |
| `"$*"`       | All arguments as one string (less safe for parsing) |

## test operators

Test operators are used in Bash to perform checks and comparisons—typically inside if statements.
eg. test expression
# or
[ expression ]
# or (advanced)
[[ expression ]]  # safer, more powerful

1) file test operators
| Operator  | Description                       |
| --------- | --------------------------------- |
| `-e file` | File exists                       |
| `-f file` | File exists and is a regular file |
| `-d file` | File exists and is a directory    |
| `-r file` | File is readable                  |
| `-w file` | File is writable                  |
| `-x file` | File is executable                |
| `-s file` | File is not empty                 |

eg. if [ -f myfile.txt ]; then
  echo "File exists."
fi


2) string test operators 
| Operator             | Description                   |
| -------------------- | ----------------------------- |
| `-z string`          | True if string is empty       |
| `-n string`          | True if string is not empty   |
| `string1 = string2`  | True if strings are equal     |
| `string1 != string2` | True if strings are not equal |

eg. if [ "$name" = "Alice" ]; then
  echo "Hi Alice!"
fi

3) integer comparison operators 
| Operator | Meaning          |
| -------- | ---------------- |
| `-eq`    | Equal to         |
| `-ne`    | Not equal to     |
| `-gt`    | Greater than     |
| `-lt`    | Less than        |
| `-ge`    | Greater or equal |
| `-le`    | Less or equal    |

eg.if [ "$age" -gt 18 ]; then
  echo "You are an adult."
fi

4) logical operator 
| Operator | Description |
| -------- | ----------- |
| `-a`     | Logical AND |
| `-o`     | Logical OR  |
| `!`      | Logical NOT |

eg.if [[ "$user" = "admin" && "$password" = "1234" ]]; then
  echo "Access granted"
fi

## case statement

The case statement in Bash is used for pattern matching and conditional branching, similar to switch in other languages (like C, Java, or Python's match).

syntax:
case "$variable" in
  pattern1)
    commands
    ;;
  pattern2)
    commands
    ;;
  *)
    default_commands
    ;;
esac
