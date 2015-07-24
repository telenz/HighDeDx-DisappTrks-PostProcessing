#!/bin/bash

# environment for the analysis tools
export ANASCRIPTS=/afs/desy.de/user/t/tlenz/anascripts
export MYPROJECT=IasUncertainty
export MYPROJECTDIR=/afs/desy.de/user/t/tlenz/myAnalysis/HighDeDx-DisappTrks-PostProcessing/systematics/signal/11_Ias/ANALYSES
export ENVSCRIPT=/afs/desy.de/user/t/tlenz/myAnalysis/HighDeDx-DisappTrks-PostProcessing/systematics/signal/11_Ias/ANALYSES/setenv.sh
export PATH=$PATH:$ANASCRIPTS:$MYPROJECTDIR/scripts

echo "Now loading root"
source  /etc/profile.d/modules.sh
module load root/5.34
echo "root is loaded"
which root