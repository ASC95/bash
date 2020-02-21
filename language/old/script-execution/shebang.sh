#!/bin/bash

# https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php

# '#!/bin/bash' must be the FIRST line of a script in order for it to have any effect. There shouldn't be any spaces before the #, #! is collectively
# referred to as the shebang (so there can't be spaces between # and !), and there cannot be spaces between ! and the path to the interpreter
# - The path to the interpreter could be relative, but making it absolute is safest and easiest
# - Without the shebang, executing this script in a Bash shell will use Bash to execute the script, regardless of whether or not the script was
#   written in Bash