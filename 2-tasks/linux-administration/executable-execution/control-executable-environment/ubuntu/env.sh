#!/usr/bin/env bash

# https://stackoverflow.com/questions/16365130/what-is-the-difference-between-usr-bin-env-bash-and-usr-bin-bash

# - The string "#!/usr/bin/env <name>" makes the shell search for and execute the first executable in $PATH that matches <name>
#   - This is useful if I don't know the exact location of <name> (e.g. /usr/bin/bash) or I want to use a different version from the default <name>
#   - Downsides:
#       - Passing command-line arguments to <name> can break depending on the OS
#       - Could theoretically execute an unintended executable (e.g. a fake "bash" somewhere in the $PATH)
# - $ env $ and $ /usr/bin/env $ both execute the same program!
#   - /usr/bin is in $PATH!

# - Running $ env $ without any arguments simply prints all environment variables in the current environment  
view_environment_variables() {
    env
}

# - $ env $ doesn't do anything special when used as the entrypoint executable (i.e. "#!/usr/bin/env <program>"). It simply runs <program> in a
#   modified environment
#   - This "modified environment" can be constructed by passing various options to the $ env $ command itself
# - If $ env <program> $ is run without any arguments, then it just looks up <program> according to whatever $PATH is set to in the current
#   environment
#   - This is advantageous if I don't want to use the default version fo <program> (e.g. /usr/bin/bash), but instead I want to use some custom version
#     of <program> that exists in my $PATH (e.g. Bash 5.x installed via Homebrew, but that's not relevant on Linux)
use_env_as_entrypoint_executable() {
    /usr/bin/env bash # This opens a Bash session in the VSCode integrated terminal. Cute!
}

#view_environment_variables
use_env_as_entrypoint_executable
