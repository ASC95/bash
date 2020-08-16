- https://unix.stackexchange.com/questions/11454/what-is-the-difference-between-a-builtin-command-and-one-that-is-not
# Examples
## Get the type of a command
### Commands
#### ping is an external command
```
$ type ping
```
#### cd is a built-in command
```
$ type cd
```
# Command types
## Built-in
- Built-in commands are implemented in the shell itself
- Some built-in commands must be built-in because they affect the state of the shell itself
  - E.g. `cd` is built-in because an external program shouldn't be changing the internal state of the shell
- Other built-in command are built-in for efficiency because loading and running an external command is more costly
  - E.g. `printf` is a built-in shell command, but the existence of a separate C `printf` function means that this command doesn't _have_ to be built-in
## External program
- Many commands are external binaries that are loaded and run by the kernel. They are not built-in to the shell
  - E.g. `ping` is an external command
- The shell is an interface to the kernel that facilitates loading and running these external commands
