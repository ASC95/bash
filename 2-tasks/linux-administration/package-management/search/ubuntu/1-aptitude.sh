#!/usr/bin/env bash

# - https://www.debian.org/doc/manuals/aptitude/ch02s04s05.en.html#tableSearchTermQuickGuide - aptitude search directives
# - https://unix.stackexchange.com/questions/73803/aptitude-search-output - reading aptitude output
# - https://www.thegeekstuff.com/2014/08/aptitude-command/ - more aptitude examples

# - Aptitude output:
#   - "i   octave": the "octave" package was installed by me manually
#   - "i A octave-common": the "octave-common" package was automatically installed, and that probably happend when I installed the "octave" package
#     (although aptitude won't tell me that)
#   - "p   libsbml5-octave": no trace of the "libsblm5-octave" package exists on my system
#   - "v   libsbml-octave": the "libsbml-octave" package is virtual
#       - I assume that if some matching implementing package was installed, the "v" would be an "i" instead
#   - Usually the middle character of the 3 leftmost characters is blank, but if it isn't, it indicates the "stored action" for the package

# - The ~n shorthand expression tells aptitude that I'm searching for all packages that have the string "python" somewhere in their name
#   - The ~n isn't required (I could just write "python"), but in future releases ~n will be required
search_for_package_with_string() {
    #aptitude search ~npython
    aptitude search ~noctave
}

search_for_package_versions() {
    #aptitude versions ~noctave # This will show ALL versions of ALL packages that contain the string "octave" in their package name
    aptitude versions "?exact-name(octave)" # This uses the ?exact-name long-form directive to match only packages named exactly "octave"
}

#search_for_package_with_string
search_for_package_versions