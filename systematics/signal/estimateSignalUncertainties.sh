#!bin/bash

source "../../variablesSetting.sh"

echo -e "\n####################################################################################################################################################"
echo -e "##################################### Estimation of signal systematic uncertainties ################################################################"
echo -e "####################################################################################################################################################\n"

mass=("200")
ctau=("10")                           #please specifiy in cm

##########################################################################################################################################################
echo -e "\n#################################################### Ecalo uncertainty ####################################################\n"
cd 7_Ecalo
root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut})"  > logFiles/uncertainty.log
cat logFiles/uncertainty.log
cd ..
echo -e "\n#################################################### n_miss_middle ####################################################\n"
cd 8_NInnerMiddleLost
root -l -b -q getSysUncertaintyMiddle.C+"(${ptCut})"  > logFiles/uncertainty_Middle.log
cat logFiles/uncertainty_Middle.log
cd ..
echo -e "\n#################################################### n_miss_inner ####################################################\n"
cd 8_NInnerMiddleLost
root -l -b -q getSysUncertaintyInner.C+"(${ptCut})"  > logFiles/uncertainty_Inner.log
cat logFiles/uncertainty_Inner.log
cd ..
echo -e "\n#################################################### trk reco eff ####################################################\n"
cd 10_TrkRecoEff
source runSystematicUncertainty.sh
cat logFiles/uncertainty_ptCutEq${ptCut}.log
cd ..
echo -e "\n#################################################### Ias ####################################################\n"
cd 11_Ias
root -l -b -q makeFit.C+"()"  > logFiles/uncertainty.log
cat logFiles/uncertainty.log
cd ..

##########################################################################################################################################################
for ct in "${ctau[@]}"
  do
    for m in "${mass[@]}"
    do
	echo "m="$m
	echo "ctau="$ct

	echo -e "\n#################################################### Estimate ISR uncertainty ####################################################\n"
	cd 2_ISR
	root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_${ct}cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..
	echo -e "\n#################################################### Estimate Trigger uncertainty ####################################################\n"
	cd 3_TriggerEfficiency
	root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_${ct}cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..
	echo -e "\n#################################################### JES uncertainty ####################################################\n"
	cd 4_JetEnergyScale
	root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_${ct}cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..
	echo -e "\n#################################################### JER uncertainty ####################################################\n"
	cd 5_JetEnergyResolution
	root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_${ct}cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..
	echo -e "\n#################################################### PDF uncertainty ####################################################\n"
	cd 6_PDF
	root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_${ct}cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..
	echo -e "\n#################################################### PU uncertainty ####################################################\n"
	cd 9_Pileup
	root -l -b -q getSysUncertainty.C+"(${ptCut},${ecaloCut},${iasCut},\"Madgraph_signal_mass_${m}_ctau_${ct}cm.root\")"  > logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cat logFiles/Madgraph_signal_mass_${m}_ctau_${ct}cm.log
	cd ..

	python addSysUncertaintiesToDatacard.py ${metCut} ${ptCut} ${ecaloCut} "${iasCut}" "${m}" "${ct}"

    done
done


