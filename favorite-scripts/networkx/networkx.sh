#!/usr/bin/env bash

# This will definitely make the refactor faster. Or will it? The Python refactor was based on known keywords and functions. There's actually no
# telling which variables and functions are invoking networkx functionality 
# - This a hefty refactor in terms of how many lines of code need to be edited. I doubt I'll finish all of it

find_networkx_files() {
    grep -rli --include "*.py" -e "\<import.*networkx" '/Users/austinchang/pycharm/omf'
    #grep -rli --include "*.py" -e "treetodinxgraph" '/Users/austinchang/pycharm/omf' # Used nowhere
    #grep -rli --include "*.py" -e "treetonxgraph" '/Users/austinchang/pycharm/omf' # Used everywhere
    #grep -rli --include "*.py" -e "latlonnxgraph" '/Users/austinchang/pycharm/omf' # Used everywhere
}
# Done:
# /Users/austinchang/pycharm/omf/omf/feeder.py
# /Users/austinchang/pycharm/omf/omf/geo.py

# Todo:
# /Users/austinchang/pycharm/omf/omf/comms.py
# /Users/austinchang/pycharm/omf/omf/models/networkStructure.py
# /Users/austinchang/pycharm/omf/omf/models/resilientDist.py
# /Users/austinchang/pycharm/omf/omf/models/solarEngineering.py
# /Users/austinchang/pycharm/omf/omf/models/smartSwitching.py
# /Users/austinchang/pycharm/omf/omf/models/derInterconnection.py
# /Users/austinchang/pycharm/omf/omf/models/commsBandwidth.py
# /Users/austinchang/pycharm/omf/omf/models/voltageDrop.py
# /Users/austinchang/pycharm/omf/omf/distNetViz.py
# /Users/austinchang/pycharm/omf/omf/scratch/outageSwitching.py
# /Users/austinchang/pycharm/omf/omf/scratch/blackstart/blackstart.py
# /Users/austinchang/pycharm/omf/omf/scratch/OpenDssDemo/dssPlot.py
# /Users/austinchang/pycharm/omf/omf/network.py

find_networkx_files