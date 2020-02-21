remove_duplicates() {
    all_models=(foo bar baz)
    changed_models=(doo dar baz)
    for target in "${changed_models[@]}"; do
        for i in "${!all_models[@]}"; do
            if [[ ${all_models[i]} = $target ]]; then
            unset 'all_models[i]'
            fi
        done
    done
    printf '%s\n' "${all_models[@]}"
}

remove_duplicates