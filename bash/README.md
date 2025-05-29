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

## array

arrays are a way to store multiple values in a single variable.

Declaring an Array
my_array=(apple banana cherry)


You can also assign elements individually:
my_array[0]=apple
my_array[1]=banana
my_array[2]=cherry


Iterating Over an Array
for item in "${my_array[@]}"; do
  echo "$item"
done

Removing Elements
unset my_array[1]


## functions

Functions in Bash allow you to group commands and reuse them, making your scripts cleaner and more modular.

Defining a Function

my_function() {
  echo "Hello from the function!"
}

or

function my_function {
  echo "Hello from the function!"
}

Calling a Function
my_function


## AWK 

awk is a powerful text processing tool used in Bash for pattern scanning and processing. It’s especially useful for handling structured text like CSVs, logs, or outputs with columns.

Basic Syntax
awk 'pattern { action }' filename

Or with pipes:
command | awk 'pattern { action }'

## sed (Stream Editor)

sed (Stream EDitor) in Bash is used to search, find, replace, insert, or delete text in a file or input stream. It’s great for quick, powerful text transformations.

Basic Syntax
sed 'command' filename

Or using pipes:
echo "text" | sed 'command'

🔹 Common sed Commands
✅ Substitute (Find and Replace)
sed 's/old/new/' file.txt


Replaces first occurrence of "old" with "new" in each line.
sed 's/old/new/g' file.txt

Replaces all occurrences of "old" with "new" per line.

✅ In-place Editing (Overwrites the file)
sed -i 's/old/new/g' file.txt

Add .bak for backup:
sed -i.bak 's/old/new/g' file.txt

✅ Delete Lines
sed '2d' file.txt       # Delete line 2
sed '/error/d' file.txt # Delete lines containing "error"

✅ Insert or Append Lines
sed '2i\New line inserted above line 2' file.txt
sed '3a\New line inserted below line 3' file.txt

✅ Replace Only on Specific Line
sed '3s/foo/bar/' file.txt
Replaces "foo" with "bar" only on line 3.

✅ Print Specific Line(s)
sed -n '5p' file.txt     # Print only line 5
sed -n '3,6p' file.txt   # Print lines 3 to 6

🔹 Quick Examples
echo "Hello world" | sed 's/world/Bash/'
# Output: Hello Bash

sed -i 's/username/root/' /etc/config.txt
