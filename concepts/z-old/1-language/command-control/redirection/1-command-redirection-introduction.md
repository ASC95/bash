# Links
- https://mywiki.wooledge.org/ProcessSubstitution?highlight=%28command%29%7C%28substitution%29 - process substitution
# Examples
## Process substitution
### Commands
```
diff <(sed -n '1,10p' base_plus_attack1a_scada.csv) <(sed -n '1,10p' base_plus_attack1a_scada.csv.bak)
```
- Process substitution is a form of redirection
- It makes the output of commands go into temporary files that are automatically deleted after the command is complete
- In this example, the `diff` command only works with files, so I need to wrangle my sed commands to output to files first
# Purpose
- Concept names are supposed to be as non-technical as possible, but I can't think of a better term than "redirection" to describe the ability to
  manipulate where the input of commands come from and where the output of commands go to
  - The term "interprocess communication" seems overly broad