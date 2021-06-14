- https://mywiki.wooledge.org/ParsingLs
- https://stackoverflow.com/questions/9847288/is-it-possible-to-use-in-a-filename - it is not possible to have a true "/" in a filename, although
  there are plenty of other unicode glyphs that look almost identical to "/"
- https://unix.stackexchange.com/questions/223823/null-and-escape-characters - It's literally not possible to pass a string containing a zero-byte as
  a command line argument, or to a system call
# Do not parse ls output
- It is impossible to get a list of filenames safely with ls because 1) there are no implementations of ls that allow me to terminate files with a NUL
  character instead of a newline 2) a file CAN have newlines in its name
  - A file can have whitespace, newlines, commas, pipes, backslashes, etc in its name
  - A file cannot have a forward slash nor a NUL character in its name
# Ways of doing what I want
- See first source and add detail as desired