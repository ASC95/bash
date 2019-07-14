#!/bin/bash

# https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source
# https://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/

# BASH_SOURCE, BASH_LINENO, and FUNCNAME are 3 bash-specific arrays that work together to provide information about the call stack of the currently
# executing program.
# - ${FUNCNAME[$i]} was called from the file ${BASH_SOURCE[$i+1]} at line number ${BASH_LINENO[$i]}
# - By itself, BASH_SOURCE does NOT always provide an absolute path to a script. Some other manipulations (which use BASH_SOURCE) are needed.

# If this file is invoked by itself, the output is:
# BASH_LINENO[0]: 90
# BASH_LINENO[1]: 0
# BASH_LINENO[2]:
# BASH_LINENO[3]:
# BASH_LINENO[4]:
# BASH_LINENO[5]:
# FUNCNAME[0]: view_call_stack
# FUNCNAME[1]: source
# FUNCNAME[2]:
# FUNCNAME[3]:
# FUNCNAME[4]:
# FUNCNAME[5]:
# BASH_SOURCE[0]: /Users/austinchang/tutorials/bash/variables/bash-variables/bashlineno-bashsource-funcname.sh
# BASH_SOURCE[1]: /Users/austinchang/tutorials/bash/variables/bash-variables/bashlineno-bashsource-funcname.sh
# BASH_SOURCE[2]:
# BASH_SOURCE[3]:
# BASH_SOURCE[4]:
# BASH_SOURCE[5]:

# If this file is executed from introduction.sh, the output is:
# BASH_LINENO[0]: 92
# BASH_LINENO[1]: 0
# BASH_LINENO[2]:
# BASH_LINENO[3]:
# BASH_LINENO[4]:
# BASH_LINENO[5]:
# FUNCNAME[0]: view_call_stack
# FUNCNAME[1]: main
# FUNCNAME[2]:
# FUNCNAME[3]:
# FUNCNAME[4]:
# FUNCNAME[5]:
# BASH_SOURCE[0]: ./bashlineno-bashsource-funcname.sh
# BASH_SOURCE[1]: ./bashlineno-bashsource-funcname.sh
# BASH_SOURCE[2]:
# BASH_SOURCE[3]:
# BASH_SOURCE[4]:
# BASH_SOURCE[5]:

# If this file is sourced from introduction.sh, the output is:
# BASH_LINENO[0]: 92
# BASH_LINENO[1]: 29
# BASH_LINENO[2]: 33
# BASH_LINENO[3]: 36
# BASH_LINENO[4]: 0
# BASH_LINENO[5]:
# FUNCNAME[0]: view_call_stack
# FUNCNAME[1]: source
# FUNCNAME[2]: bashLineno_bashSource_funcname
# FUNCNAME[3]: bashLineno_bashSource_funcname_helper
# FUNCNAME[4]: source
# FUNCNAME[5]:
# BASH_SOURCE[0]: bashlineno-bashsource-funcname.sh
# BASH_SOURCE[1]: bashlineno-bashsource-funcname.sh
# BASH_SOURCE[2]: /Users/austinchang/tutorials/bash/variables/bash-variables/introduction.sh
# BASH_SOURCE[3]: /Users/austinchang/tutorials/bash/variables/bash-variables/introduction.sh
# BASH_SOURCE[4]: /Users/austinchang/tutorials/bash/variables/bash-variables/introduction.sh
# BASH_SOURCE[5]:

view_call_stack() {
    echo Hello from bashlineno-bashsource-funcname.sh
    echo BASH_LINENO[0]: ${BASH_LINENO[0]}
    echo BASH_LINENO[1]: ${BASH_LINENO[1]}
    echo BASH_LINENO[2]: ${BASH_LINENO[2]}
    echo BASH_LINENO[3]: ${BASH_LINENO[3]}
    echo BASH_LINENO[4]: ${BASH_LINENO[4]}
    echo BASH_LINENO[5]: ${BASH_LINENO[5]}
    echo FUNCNAME[0]: ${FUNCNAME[0]}
    echo FUNCNAME[1]: ${FUNCNAME[1]}
    echo FUNCNAME[2]: ${FUNCNAME[2]}
    echo FUNCNAME[3]: ${FUNCNAME[3]}
    echo FUNCNAME[4]: ${FUNCNAME[4]}
    echo FUNCNAME[5]: ${FUNCNAME[5]}
    echo BASH_SOURCE[0]: ${BASH_SOURCE[0]}
    echo BASH_SOURCE[1]: ${BASH_SOURCE[1]}
    echo BASH_SOURCE[2]: ${BASH_SOURCE[2]}
    echo BASH_SOURCE[3]: ${BASH_SOURCE[3]}
    echo BASH_SOURCE[4]: ${BASH_SOURCE[4]}
    echo BASH_SOURCE[5]: ${BASH_SOURCE[5]}
}
view_call_stack