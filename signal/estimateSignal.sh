#!bin/bash

#source "../variablesSetting.sh"

root -l -b -q getSignalResult.C+"(${metCut},${jetptCut},${ptCut},${ecaloCut},${iasCut},\"${region}\")" > signal.log
cat signal.log

rm *~
#rm *_C.d
#rm *_C.so