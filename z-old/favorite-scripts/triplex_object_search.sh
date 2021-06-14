#!/bin/bash

# Goal: print out every file path that contains triplex nodes or triplex loads. Also print out how many of each were found in each file.

first_approach() {
    cur_dir="$(pwd)"
    cd ~/pycharm/omf
    grep -rce "\"object\": \"triplex_node\"" -e "\"object\": \"triplex_load\"" . | grep -v ":0$" | sort -t ":" -k 2,2 -n
    cd "$cur_dir"
}
first_approach

# All of these feeders have of course been anonymized. Therefore, I'm not going to be able to use real lat/lons of triplex load/node objects to
# replace them

# ./omf/static/publicFeeders/OMF_Norfork1_Calibrated.omd:1
# ./omf/static/publicFeeders/Simple Market System AnonTest.omd:1
# ./omf/static/publicFeeders/Simple Market System BROKEN.omd:1
# ./omf/static/publicFeeders/Simple Market System Comm Solar.omd:1
# ./omf/static/publicFeeders/Simple Market System Indy Solar.omd:1
# ./omf/static/publicFeeders/Simple Market System.omd:1
# ./omf/static/testFiles/Input - IEEE 13 Node.omd:1
# ./omf/scratch/glmSuperModel/R1-12.47-3/superModelTiny.json:2
# ./omf/scratch/glmSuperModel/R1-12.47-3/superModelTinyBase.json:2
# ./omf/scratch/glmSuperModel/R1-12.47-3/superModelTinyZeroTech.json:2
# ./omf/static/publicFeeders/Simple Market Modified DER.omd:3
# ./omf/static/testFiles/distNetVizSpec.js:3
# ./omf/data/Model/public/Demo superModel/superModel Today.omd:140
# ./omf/data/Model/public/Demo superModel/superModel Today/feeder.omd:140
# ./omf/data/Model/public/Demo superModel/superModel Tomorrow.omd:140
# ./omf/data/Model/public/Demo superModel/superModel Tomorrow/feeder.omd:140
# ./omf/scratch/glmSuperModel/R4-25.00-1/xOut_regularModelRural.json:140
# ./omf/scratch/glmSuperModel/R4-25.00-1/xOut_superModelRural.json:140
# ./omf/static/publicFeeders/superModel Today.omd:140
# ./omf/static/publicFeeders/superModel Tomorrow.omd:140
# ./omf/static/publicFeeders/Olin Barre Fault.omd:333
# ./omf/static/publicFeeders/Olin Barre Geo Modified DER.omd:333
# ./omf/static/publicFeeders/Olin Barre Geo.omd:333
# ./omf/static/publicFeeders/Olin Barre.omd:333
# ./omf/data/Model/public/Demo Batter Olin Barre GH Battery/Olin Barre GH Battery/Olin-Barre-RealMapFeet.omd:339
# ./omf/data/Model/public/Demo Batter Olin Barre GH Battery/Olin Barre LatLon.omd:339
# ./omf/data/Model/public/Demo Batter Olin Barre GH Battery/Olin-Barre-RealMapFeet.omd:339
# ./omf/scratch/Olin-Barre-RealMapFeet.omd:339
# ./omf/static/publicFeeders/Olin Barre LatLon.omd:339
# ./omf/data/Model/public/Demo cvrStatic ABEC Columbia/ABEC Columbia.omd:439
# ./omf/data/Model/public/Demo voltageDrop ABEC Columbia/ABEC Columbia.omd:439
# ./omf/static/publicFeeders/ABEC Columbia.omd:439
# ./omf/static/publicFeeders/Olin Beckenham Calibrated.omd:583
# ./omf/static/publicFeeders/Orville Tree Pond Calibrated.omd:715
# ./omf/scratch/glmSuperModel/bigSuperModel/glmSuperModel.json:1237
# ./omf/scratch/glmSuperModel/bigSuperModel/glmSuperModelOmfFormat.json:1237
# ./omf/static/publicFeeders/ABEC Frank Calibrated.omd:1242
# ./omf/static/publicFeeders/ABEC Frank LO.omd:1242
# ./omf/data/Model/public/Demo gridlabMulti scadaCalibration/Calibrated Feeder.omd.backup:1276
# ./omf/data/Model/public/Demo gridlabMulti scadaCalibration/Calibrated Feeder.omd:1276
# ./omf/data/Model/public/Demo gridlabMulti scadaCalibration/Calibrated Feeder/feeder.omd:1276
# ./omf/data/Model/public/Demo gridlabMulti scadaCalibration/Uncalibrated Feeder.omd:1276
# ./omf/data/Model/public/Demo gridlabMulti scadaCalibration/Uncalibrated Feeder/feeder.omd:1276
# ./omf/static/publicFeeders/ABEC Frank Calibrated with Voltage.omd:1276
# ./omf/static/publicFeeders/ABEC Frank pre calib.omd:1276
# ./omf/static/publicFeeders/PNNL Taxonomy Feeder 1.omd:3250
# ./omf/static/publicFeeders/Autocli Alberich Calibrated.omd:3988