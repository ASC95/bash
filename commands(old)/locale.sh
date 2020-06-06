# https://unix.stackexchange.com/questions/149111/what-should-i-set-my-locale-to-and-what-are-the-implications-of-doing-so - locale description
# https://serverfault.com/questions/54591/how-to-install-change-locale-on-debian - step by step instructions for Debian (Czar)
# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-debian-ubuntu-docker-container - same instructions, but with Docker too
# if needed

# A locale is composed of many, many settings that affect everything from which characters are used in terminal applications to date and time
# formatting. Locale data can be large, which is why many distributions don't ship with a lot of locales. Locales must often be installed separately.
# Locale settings are determined by environment variables:
# - The LC_<whatever> settings are ALSO available as environment variables
# - If LC_ALL is set, it overrides all other locale environment variables

# The Debian procedure works on Ubuntu too!
install_locale_on_ubuntu() {

}

# Installing locales on Debian in a script-safe manner is really, really annoying
# - Approach 1
#   - Edit /etc/locale.gen to uncomment the locales that I want to download 2) run the $ locale-gen $ command. Docker Debian does not even have the
#     /etc/locale.gen file, nor is local-gen a command. I have to get both of these by installing the locales package (apt-get update && apt-get -y
#     install locales).
#   - Uncomment "en_US.UTF-8" with $ sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
#   - Generate the locale with $ locale-gen
#   - If I want, set the locale with $ export LC_ALL=en_US.utf8
#   - When done from Python, setting the locale to "en_US.UTF-8" or "en_US.utf8" both work
install_locale_on_debian() {
    # complicated!
}

view_installed_locales() {
    locale -a
}

view_installed_locales