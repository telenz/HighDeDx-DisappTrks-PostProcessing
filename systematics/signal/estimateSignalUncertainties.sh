#!bin/bash

#source "../../variablesSetting.sh"

echo -e "\n####################################################################################################################################################"
echo -e "##################################### Estimation of signal systematic uncertainties ################################################################"
echo -e "####################################################################################################################################################\n"

mass=("100" "200" "300" "400" "500")
ctau=("1" "5" "10" "50" "100")                           #please specifiy in cm

##########################################################################################################################################################
echo -e "\n#################################################### Ecalo uncertainty ####################################################\n"
cd 7_Ecalo
if [ ! -f "logFiles/uncertainty_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}.log" ] 
then
    root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut})"  > logFiles/uncertainty_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}.log
    cat logFiles/uncertainty_ptCutEq${ptCut}_ecaloCutEq${ecaloCut}.log
fi
cd ..
echo -e "\n#################################################### n_miss_middle ####################################################\n"
cd 8_NInnerMiddleLost
if [ ! -f "logFiles/uncertainty_Middle_ptCutEq${ptCut}.log" ] 
then
    root -l -b -q getSysUncertaintyMiddle.C+"(${ptCut})"  > logFiles/uncertainty_Middle_ptCutEq${ptCut}.log
fi
cat logFiles/uncertainty_Middle_ptCutEq${ptCut}.log
cd ..
echo -e "\n#################################################### n_miss_inner ####################################################\n"
cd 8_NInnerMiddleLost
if [ ! -f "logFiles/uncertainty_Inner_ptCutEq${ptCut}.log" ] 
then
    root -l -b -q getSysUncertaintyInner.C+"(${ptCut})"  > logFiles/uncertainty_Inner_ptCutEq${ptCut}.log
fi
cat logFiles/uncertainty_Inner_ptCutEq${ptCut}.log
cd ..
echo -e "\n#################################################### trk reco eff ####################################################\n"
cd 10_TrkRecoEff
if [ ! -f "logFiles/uncertainty_ptCutEq${ptCut}.log" ]
then
    source runSystematicUncertainty.sh
    cat logFiles/uncertainty_ptCutEq${ptCut}.log
fi
cd ..
echo -e "\n#################################################### Ias ####################################################\n"
cd 11_Ias
root -l -b -q makeFit.C+"()"  > logFiles/uncertainty.log
cat logFiles/uncertainty.log
cd ..

##########################################################################################################################################################
for m in "${mass[@]}"
    do
    echo "m="$m

    echo -e "\n#################################################### Estimate ISR uncertainty ####################################################\n"
    cd 2_ISR
    root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_100cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
    cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
    cd ..
    echo -e "\n#################################################### Estimate Trigger uncertainty ####################################################\n"
    cd 3_TriggerEfficiency
    root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_100cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
    cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
    cd ..
    echo -e "\n#################################################### JES uncertainty ####################################################\n"
    cd 4_JetEnergyScale
    root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_100cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
    cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
    cd ..
    echo -e "\n#################################################### JER uncertainty ####################################################\n"
    cd 5_JetEnergyResolution
    root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_100cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
    cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
    cd ..
    echo -e "\n#################################################### PDF uncertainty ####################################################\n"
    cd 6_PDF
    root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_100cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
    cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
    cd ..
    echo -e "\n#################################################### PU uncertainty ####################################################\n"
    
    for ct in "${ctau[@]}"
    do
	echo "ctau="$ct

	echo -e "\n#################################################### Estimate ISR uncertainty ####################################################\n"
	cd 2_ISR
	cp logFiles/Madgraph_signal_mass_${m}_ctau_100cm.log logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..
	echo -e "\n#################################################### Estimate Trigger uncertainty ####################################################\n"
	cd 3_TriggerEfficiency
	cp logFiles/Madgraph_signal_mass_${m}_ctau_100cm.log logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..
	echo -e "\n#################################################### JES uncertainty ####################################################\n"
	cd 4_JetEnergyScale
	cp logFiles/Madgraph_signal_mass_${m}_ctau_100cm.log logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..
	echo -e "\n#################################################### JER uncertainty ####################################################\n"
	cd 5_JetEnergyResolution
	cp logFiles/Madgraph_signal_mass_${m}_ctau_100cm.log logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..
	echo -e "\n#################################################### PDF uncertainty ####################################################\n"
	cd 6_PDF
	cp logFiles/Madgraph_signal_mass_${m}_ctau_100cm.log logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..
	echo -e "\n#################################################### PU uncertainty ####################################################\n"
	cd 9_Pileup
	root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_${ct}cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..

	python addSysUncertaintiesToDatacard.py ${metCut} ${ptCut} ${ecaloCut} "${iasCut}" "${m}" "${ct}"

    done
done


