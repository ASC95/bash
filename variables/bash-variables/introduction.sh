# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html - special Bash variables (Bash only)

################################################################################################
### Don't move these function around or change it because doing so will mess up line numbers ###
################################################################################################
bashLineno_bashSource_funcname() {
    echo Hello from introduction.sh
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
    dir=$(dirname ${BASH_SOURCE[0]})
    cd $dir
    #./bashlineno-bashsource-funcname.sh
    . bashlineno-bashsource-funcname.sh
}

bashLineno_bashSource_funcname_helper() {
    bashLineno_bashSource_funcname
}

bashLineno_bashSource_funcname_helper
################################################################################################
### Don't move these function around or change it because doing so will mess up line numbers ###
################################################################################################