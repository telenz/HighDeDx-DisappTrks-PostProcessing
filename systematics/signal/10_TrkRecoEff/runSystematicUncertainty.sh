#!bin/bash

#ptCut=60

###########################################################################################################################
# edit analyzer.cc file and run analysis


if [ ! -f "logFiles/uncertainty_ptCutEq${ptCut}.log" ] 
then
    echo ""
    echo "%%%%%%%%% logFiles/uncertainty_ptCutEq${ptCut}.log does not exists: Estimate trk reco eff uncertainty: "
    echo ""

    cd removeHits
    sed -e "s/MuonTracksAllHits_pt\[i\] < __ptCut__/MuonTracksAllHits_pt\[i\] < ${ptCut}/" analyzer.cc > analyzerAux.cc
    mv analyzerAux.cc analyzer.cc
    #make clean
    make
    echo "before analysis"
    ./analyzer filelist_data.txt analyzer_histogram_data.root > ../result_data.log
    ./analyzer filelist_mc.txt   analyzer_histogram_mc.root   > ../result_mc.log
    echo "after analysis"
    sed -e "s/MuonTracksAllHits_pt\[i\] < ${ptCut}/MuonTracksAllHits_pt[i] < __ptCut__/" analyzer.cc > analyzerAux.cc
    mv analyzerAux.cc analyzer.cc
    cd ..
    python getSysUncertainty.py > logFiles/uncertainty_ptCutEq${ptCut}.log
fi
cat logFiles/uncertainty_ptCutEq${ptCut}.log
###########################################################################################################################


rm *~
