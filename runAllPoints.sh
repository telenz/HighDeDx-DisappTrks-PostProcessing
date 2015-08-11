#!/bin/bash

metCut=100
jetptCut=110
ecaloCut=5
region="SR"


ptArray=(20 25 30 35 40 45 50 55 60)
iasArray=(0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40)

find . -type f -name "*.log" -not -path "./limits/*" -not -path  "./systematics/signal/12_xsec/*" -not -path  "./systematics/signal/1_Luminosity/*"  -exec rm -f {} \;

for ptCut in "${ptArray[@]}"
do
    for iasCut in "${iasArray[@]}"
    do
	echo ""
	echo " ************************************************** Pt  Cut = ${ptCut}    **************************************************"
	echo " ************************************************** Ias Cut = ${iasCut}  **************************************************"
	echo ""
	cd fakeBkg
	source estimateFakeBkg.sh
	cd ../leptonicBkg
	source estimateLeptonicBkg.sh
	python makeDatacard.py ${metCut} ${ptCut} ${ecaloCut} "${iasCut}"
	cd ../signal
	source estimateSignal.sh
	python makeSignalDatacard.py ${metCut} ${ptCut} ${ecaloCut} "${iasCut}"
	cd ../systematics/bkg
	source estimateBkgUncertainties.sh
	cd ../signal
	source estimateSignalUncertainties.sh
	cd ../..
    done
done


rm *~


