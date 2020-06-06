

# Use the --include <regex> flag to filter which files will be searched 
include_files() {
    grep --include "*.py" -r '\<warnings.filterwarnings(' '/Users/austinchang/pycharm/omf'
}

include_files