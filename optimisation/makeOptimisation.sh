#!/bin/bash

metCut=100
jetptCut=110
ecaloCut=5
region="SR"


ptArray=(20 25 30 35 40 45 50 55 60)
#iasArray=(0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50)
#ptArray=(30)
iasArray=(0.00 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40)
#ptCut= 35
#iasCut=0.3

for ptCut in "${ptArray[@]}"
do
    for iasCut in "${iasArray[@]}"
    do
	echo ""
	echo " ************************************************** Pt  Cut = ${ptCut}    **************************************************"
	echo " ************************************************** Ias Cut = ${iasCut}  **************************************************"
	echo ""
	cd ../fakeBkg
	source estimateFakeBkg.sh

	cd ../leptonicBkg
	source estimateLeptonicBkg.sh

	cd ../signal
	source estimateSignal.sh

    done
done

cd ../optimisation

cp -rp ../leptonicBkg/results/Total*.root totalBkg/.
cp -rp ../signal/results/*.root signal/.


#root -l -b -q calculateSignificance.C+"(${metCut}, ${ecaloCut}, \"${region}\")"

rm *~
rm *_C.d
rm *_C.so


