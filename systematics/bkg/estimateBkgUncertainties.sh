#!bin/bash

source "/afs/desy.de/user/t/tlenz/myAnalysis/bkgEstimation/variablesSetting.sh"

echo -e "\n####################################################################################################################################################"
echo -e "##################################### Estimation of bkg systematic uncertainties ###################################################################"
echo -e "####################################################################################################################################################\n"

##########################################################################################################################################################
echo -e "\n#################################################### Estimate leptonic scale factor uncertainty ####################################################\n"
cd 1_LeptonScaleFactors

if [ ! -f "logFiles/pion.log" ] 
then
    echo ""
    echo "%%%%%%%%% pion.log does not exists: Estimate pion uncertainty: "
    echo ""
    root -l -b -q getSysUncertainty.C+"(211,20,5000)"   > logFiles/pion.log
    cat logFiles/pion.log
fi
if [ ! -f "logFiles/electron_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}.log" ] 
then
    echo ""
    echo "%%%%%%%%% electron_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}.log does not exists: Estimate electron uncertainty: "
    echo ""
    root -l -b -q getSysUncertainty.C+"(11,${ptCut},${ecaloCut})" > logFiles/electron_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}.log
    cat logFiles/electron_${ptCut}.log
fi
if [ ! -f "logFiles/muon_ecaloCutEq${ecaloCut}.log" ] 
then
    echo ""
    echo "%%%%%%%%% muon_ecaloCutEq${ecaloCut}.log does not exists: Estimate muon uncertainty: "
    echo ""
    root -l -b -q getSysUncertainty.C+"(13,20,${ecaloCut})"       > logFiles/muon_ecaloCutEq${ecaloCut}.log
    cat logFiles/muon.log
fi
cd ../
##########################################################################################################################################################
echo -e "\n#################################################### Estimate leptonic I_as uncertainty         ####################################################\n"
cd 2_LeptonIas

iasCut2=`bc << EOF
$iasCut * 100
EOF
`
iasCut2=${iasCut2%.*}

if [ ${iasCut2} \< 10 ] ; then iasCut2=0$iasCut2 ; fi;
echo $iasCut2

if [ ! -f "logFiles/pion_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log" ] 
then
    echo ""
    echo "%%%%%%%%% pion_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log does not exists: Estimate pion uncertainty: "
    echo ""
    root -l -b -q getSysUncertainty.C+"(211,${ptCut},5000,${iasCut})"   > logFiles/pion_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log
    cat logFiles/pion_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log
fi
if [ ! -f "logFiles/electron_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log" ] 
then
    echo ""
    echo "%%%%%%%%% electron_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log does not exists: Estimate electron uncertainty: "
    echo ""
    root -l -b -q getSysUncertainty.C+"(11,${ptCut},5000,${iasCut})"   > logFiles/electron_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log
    cat logFiles/electron_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log
fi
if [ ! -f "logFiles/muon_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log" ] 
then
    echo ""
    echo "%%%%%%%%% muon_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log does not exists: Estimate muon uncertainty: "
    echo ""
    root -l -b -q getSysUncertainty.C+"(13,${ptCut},5000,${iasCut})"        > logFiles/muon_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log
    cat logFiles/muon_ptCutEq${ptCut}_iasCutEq0p${iasCut2}.log
fi
cd ../
##########################################################################################################################################################
echo -e "\n#################################################### Estimate fake rate uncertainty             ####################################################\n"
cd 3_FakeRate

if [ ! -f "logFiles/fake_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}.log" ] 
then
    echo ""
    echo "%%%%%%%%% fake_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}.log does not exists: Estimate fake uncertainty: "
    echo ""
    root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut})"   > logFiles/fake_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}.log
    cat logFiles/fake_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}.log
fi

cd ../
##########################################################################################################################################################
echo -e "\n#################################################### Estimate fake Ias uncertainty              ####################################################\n"
cd 4_FakeIas

if [ ! -f "logFiles/fake_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}_iasCutEq0p${iasCut2}.log" ] 
then
    echo ""
    echo "%%%%%%%%% fake_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}_iasCutEq0p${iasCut2}.log does not exists: Estimate fake uncertainty: "
    echo ""
    root -l -b -q getSysUncertainty.C+"(${ptCut}, ${ecaloCut}, ${iasCut})"   > logFiles/fake_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}_iasCutEq0p${iasCut2}.log
    cat logFiles/fake_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}_iasCutEq0p${iasCut2}.log
fi
cd ../
##########################################################################################################################################################
rm *~

mass=("100" "200" "300" "400" "500")
ctau=("1" "5" "10" "50" "100")                           #please specifiy in cm

for ct in "${ctau[@]}"
  do
    for m in "${mass[@]}"
    do
	echo "m="$m
	echo "ctau="$ct
	python addSysUncertaintiesToDatacard.py ${metCut} ${ptCut} ${ecaloCut} "${iasCut}" "${m}" "${ct}"
    done
done