#!/bin/bash

# https://linuxconfig.org/learning-linux-commands-export
# https://unix.stackexchange.com/questions/130985/if-processes-inherit-the-parents-environment-why-do-we-need-export/130989

# - A forked child process (e.g. invoking $ bash $ from within an existing shell process) DOES inherit its ENVIRONMENT from its parent process. That
#   means it gets all environment variables.
# - However, shell variables are NOT in the environment, so a forked child process does NOT inherit copies of the shell variables of its parent
#   - A shell variable must be exported with $ export $ to become part of the environment (and thus become an environment variable)