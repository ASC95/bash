#!/usr/bin/env bash
set -uo pipefail

# - http://www.linuxfromscratch.org/lfs/view/8.2-systemd/chapter07/locale.html - how to properly install a locale and deal with idiosyncracies in
#   locale names
# - https://unix.stackexchange.com/questions/187237/is-it-possible-to-limit-the-set-of-english-locales-on-a-system - exactly describes my problem with
#   too many English locales
# - https://unix.stackexchange.com/questions/204328/change-a-locale-definition-as-opposed-to-a-locale-setting - how to modify a locale definition
#   (hopefully I never have to do this)
# - https://unix.stackexchange.com/questions/246846/cant-generate-en-us-utf-8-locale - locale-gen syntax on Ubuntu and Debian
# - https://wiki.debian.org/Locale - Debian instructions for how to configure a locale
# - https://serverfault.com/questions/604846/locale-gen-with-purge-does-not-work - one way of getting rid of locales on Ubuntu


# - This will a display a list of locale names that have already been built on my system that I could switch to if I wanted
#   - This list is in the "proper" locale name format, which is actually the MOST ambiguous way of displaying locale names
#       - Thus, some listed locale names are actually duplicates of the same underlying locale configuration (e.g. en_IL and en_IL.utf8)
# - This is the LEAST useful way of viewing locales
display_a_human_readable_list_of_available_locales() {
    locale -a
}

# - This will display the same list of locales as $ locale -a $, but with redundant locale names removed
#   - Actually this file DOESN'T change when I compile new locales! What gives?
# - This is the file that Ubuntu reads from to determine which locales are available
#   - /var/lib/locales/supported.d/en seems to be the ACTUAL file that controls which locales are built with $ sudo locale-gen $, at least for English
#     locales
#       - I don't know why Ubuntu generates this files as it does. It should only contain the en_US.utf8 locale, but it contains a bunch of other
#         English locales
#       - Based on reading $ aptitude search ~i~nlanguage $, it seems that Ubuntu installs all of these locales in order to transparently translate
#         English dialects. I guess that's useful
#       - This files is NOT a human configuration file (it's in /var after all)
#           -  Thus, any changes that I make to it won't persist after updates to "language-pack-*-base" or "language-pack-*" packages
display_a_machine_readable_list_of_available_locales() {
    cat '/var/lib/locales/supported.d/en'
}

# - This will display all of the locales that my machine knows about in a machine-readable format
# - The /etc/locale.gen file contains the names of locales that I could build if I wanted to
#   - In order to build a locale, I need to uncomment it in this file and then rerun $ sudo locale-gen
#   - If the locale I want is listed in this file, I don't need to install any language pack
display_a_machine_readable_list_of_all_locales() {
    cat '/etc/locale.gen'
}

# - My default locale is "en_US.UTF-8 UTF-8" as shown by $ locale -a
# - It's quite easy to compile a new locale with Ubuntu!
build_locales() {
    # - First, view which locales are available
    #cat '/etc/locale.gen'
    # - Next, specify the new locales that I want to compile. Read the markdown to understand how to provide a locale name
    sudo locale-gen es_MX.UTF-8
}

remove_locales() {
    echo 'todo'
}

provide_locale_to_command() {

}

#list_installed_locales
#list_currently_configured_locale_variables
#view_locales_that_could_be_built
#build_locales
#remove_locales
provide_locale_to_command