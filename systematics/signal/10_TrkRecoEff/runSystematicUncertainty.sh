#!bin/bash

ptCut=50

###########################################################################################################################
# edit analyzer.cc file and run analysis
cd removeHits
sed -e "s/MuonTracksAllHits_pt\[i\] < __ptCut__/MuonTracksAllHits_pt\[i\] < ${ptCut}/" analyzer.cc > analyzerAux.cc
cp analyzerAux.cc analyzer.cc
#make clean
make
./analyzer filelist_data.txt analyzer_histogram_data.root > ../result_data.log
./analyzer filelist_mc.txt   analyzer_histogram_mc.root   > ../result_mc.log
sed -e "s/MuonTracksAllHits_pt\[i\] < ${ptCut}/MuonTracksAllHits_pt[i] < __ptCut__/" analyzer.cc > analyzerAux.cc
cp analyzerAux.cc analyzer.cc
cd ..
###########################################################################################################################

python getSysUncertainty.py > result.log
cat result.log

rm *~
