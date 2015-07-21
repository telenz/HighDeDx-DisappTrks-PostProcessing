#!/bin/bash

source variablesSetting.sh

rm leptonicBkg/datacards/*
rm signal/datacards/*
rm systematics/bkg/datacards/*

cd fakeBkg
source estimateFakeBkg.sh
cd ../leptonicBkg
source estimateLeptonicBkg.sh
#python makeDatacard.py ${metCut} ${ptCut} ${ecaloCut} "${iasCut}"
#cd ../signal
#source estimateSignal.sh
#python makeSignalDatacard.py ${metCut} ${ptCut} ${ecaloCut} "${iasCut}"
#cd ../systematics/bkg
#source estimateBkgUncertainties.sh

cd ../