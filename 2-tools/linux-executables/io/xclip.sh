# - This works when run in the terminal but not when this file is executed as a task
# - I made this into an alias
copy_stdout_to_clipboard() {
    echo Obi-Wan | xclip -r -selection clipboard
}

copy_stdout_to_clipboard
