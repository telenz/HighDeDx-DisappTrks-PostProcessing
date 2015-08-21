#!/bin/bash

metCut=100
jetptCut=110
ecaloCut=5
region="SR"


#ptArray=(30 50)
#iasArray=(0.05 0.30)

#ptArray=(30)
#iasArray=(0.05)

find . -type f -name "*.log" -not -path "./limits/*" -not -path  "./systematics/signal/12_xsec/*" -not -path  "./systematics/signal/1_Luminosity/*"  -not -path  "./systematics/signal/10_TrkRecoEff/*" -exec rm -f {} \;
rm systematics/signal/datacards/*

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

var=$(date +"%F"_"%H"-"%M"-"%S")
cp -rp systematics/signal/datacards systematics/datacards_${var}


rm *~


