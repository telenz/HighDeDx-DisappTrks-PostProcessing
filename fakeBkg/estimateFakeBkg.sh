#!/bin/bash

#source "../variablesSetting.sh"

echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% Make fake background estimates %%%%%%%%%%%%%%%%%%%%%%%"
root -l -b -q a1_fakeRatesFromData.C+"(${ptCut},${ecaloCut})" 

root -l -b << EOF
   .L a2_makeTemplates.C+
   makeIasTemplates(${metCut},${jetptCut},${ptCut},${ecaloCut},${iasCut})
   makeECaloTemplates(${metCut},${jetptCut},${ptCut},${ecaloCut})
EOF

root -l -b -q a3_getFakePrediction.C+"(${metCut}, ${jetptCut} , ${ecaloCut} , ${iasCut} , ${ptCut})" 


rm *~