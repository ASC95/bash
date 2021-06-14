- https://unix.stackexchange.com/questions/11454/what-is-the-difference-between-a-builtin-command-and-one-that-is-not

# Examining commands
- There are two commands to try when I want to examine a command:
    - $ `man <command>`
    - $ `help <command>`

# Commands
- There are 3 types of commands: built-ins, 
- /usr/bin contains built-ins and files
- /bin contains files

## Built-ins
- A built-in command is executed by the shell itself. This is different from non-built-in commands that are actually programs that are loaded and run
  separately
- Loading and running an external program (which is handled by the kernel, but the shell forwards information to the kernel) takes time, so built-ins
  can be faster than external programs because they avoid this overhead
- A built-in command can affect the internal state of the shell. External programs cannot do this.
- Additionally, there are conceptual subcategories of built-ins: special built-ins, shell-modifying built-ins, and performance built-ins

## Executable files
- An executable file