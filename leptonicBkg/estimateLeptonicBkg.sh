#!bin/bash

#source "/afs/desy.de/user/t/tlenz/myAnalysis/bkgEstimation/variablesSetting.sh"

echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% Make leptonic background estimates %%%%%%%%%%%%%%%%%%%%%%%"

rm *log
rm datacards/*

## 1.) Get scaling factors s = N_MC^SR/N_MC^CR
root -l -b -q a1_getScalingFactors.C+"(211,${metCut},${jetptCut},0,${ptCut},${ecaloCut},\"${region}\")" > logFiles/pion.log
root -l -b -q a1_getScalingFactors.C+"(11,${metCut},${jetptCut},0,${ptCut},${ecaloCut},\"${region}\")"  > logFiles/elec.log
root -l -b -q a1_getScalingFactors.C+"(13,${metCut},${jetptCut},1,${ptCut},${ecaloCut},\"${region}\")"  > logFiles/muon.log

## 1a.) Get Ias template
root -l -b -q a2_makeTemplates.C+"(211,${metCut},${jetptCut},${ptCut},${ecaloCut},${iasCut},\"${region}\")" >> logFiles/pion.log
root -l -b -q a2_makeTemplates.C+"(11,${metCut},${jetptCut},${ptCut},${ecaloCut},${iasCut},\"${region}\")"  >> logFiles/elec.log
root -l -b -q a2_makeTemplates.C+"(13,${metCut},${jetptCut},${ptCut},${ecaloCut},${iasCut},\"${region}\")"  >> logFiles/muon.log


## 2.) Get leptonic bkg prediction
root -l -b -q a3_getLeptonPrediction.C+"(211,${metCut},${jetptCut},${ptCut},${iasCut},0,${ecaloCut},\"${region}\")" >> logFiles/pion.log
cat logFiles/pion.log
root -l -b -q a3_getLeptonPrediction.C+"(11,${metCut},${jetptCut},${ptCut},${iasCut},0,${ecaloCut},\"${region}\")" >> logFiles/elec.log
cat logFiles/elec.log
root -l -b -q a3_getLeptonPrediction.C+"(13,${metCut},${jetptCut},${ptCut},${iasCut},1,${ecaloCut},\"${region}\")" >> logFiles/muon.log
cat logFiles/muon.log


## 3.) Add all bks together
root -l -b -q   a4_addBkgsTogether.C+"(${metCut},${ptCut},${ecaloCut},${iasCut},\"${region}\")" > logFiles/results.log
cat logFiles/results.log


#rm a1_getScalingFactors_C.*
#rm a2_getLeptonPrediction_C.*
#rm a3_addBkgsTogether_C.*
#rm *_C.d
#rm *_C.so
rm *~