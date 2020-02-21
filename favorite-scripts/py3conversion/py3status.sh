#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

show_changed_files() {
    cd '/Users/austinchang/pycharm/omf'
    git log ^master py3conversion --oneline | awk '// {print $2}' | grep -i 'omf' | sort -u
    #git log ^master py3conversion --oneline
}

# These files may or may not have been changed in other ways
show_files_that_have_been_print_refactored() {
    cd '/Users/austinchang/pycharm/omf'
    printf '%s\n' 'These files have been refactored with regard to print()'
    git log ^master py3conversion --oneline | grep -i -e 'omf' -e 'print' | awk '// {print $2}' | sort -u
}

show_files_that_have_been_refactored_other_than_print() {
    cd '/Users/austinchang/pycharm/omf'
    printf '%s\n' 'These files have been refactored in a way unrelated to print()'
    git log ^master py3conversion --oneline | grep -i -e 'omf' | grep -iv 'print' | awk '// {print $2}' | sort -u
}

show_changed_models() {
    cd '/Users/austinchang/pycharm/omf'
    git log ^master py3conversion --oneline | awk '// {print $2}' | grep -i 'omf/models' | sed -E 's/omf\/.*\///' | sort -u
}

# This is really, really hard
# TODO: figure out how to do this
show_unchanged_models() {
    all_models_string=$(find '/Users/austinchang/pycharm/omf/omf/models' -name "*.py" | sed -E 's/\/.*\///' | sort -u)
    #all_models_string+=$'\n'
    changed_models_string=$(show_changed_models)
    #printf '%s' "$all_models_string"
    #printf '\n\n'
    #printf '%s' "$changed_models_string"
    read -a all_models <<< "$all_models_string"
    for e in "${all_models[@]}"
    do
        printf '%s\n' $e
    done
} 

#show_changed_files
#show_files_that_have_been_print_refactored
show_files_that_have_been_refactored_other_than_print
#show_changed_models