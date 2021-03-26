# https://mywiki.wooledge.org/BashGuide/TestsAndConditionals
- Good Practice: Whenever you're making a Bash script, you should always use [[ rather than [. Whenever you're making a Shell script, which may end up
  being used in an environment where Bash is not available, you should use [, because it is far more portable. (While being built in to Bash and some
  other shells, [ should be available as an external application as well; meaning it will work as argument to, for example, find's -exec and xargs.)
  Don't ever use the -a or -o tests of the [ command. Use multiple [ commands instead (or use [[ if you can). POSIX doesn't define the behavior of [
  with complex sets of tests, so you never know what you'll get.
