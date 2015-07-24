#!bin/bash

folder="analysis_2015_07_24_WithVertexCondition_FinerBinning"

#%%%%%%%%%%%%%%%%%%%%%%%% Hadd ouput files to one file  %%%%%%%%%%%%%%%%%%%%%%%%%%%

start=$(date +%s)
# ---- MC
if [ -d ${folder}/results/analyzer/ntuples/mc ]; then hadd -f ${folder}/results/analyzer/ntuples/mc.root ${folder}/results/analyzer/ntuples/mc/*.root;fi;
# ---- DATA
if [ -d ${folder}/results/analyzer/ntuples/data ]; then hadd -f ${folder}/results/analyzer/ntuples/data.root ${folder}/results/analyzer/ntuples/data/*.root;fi;

rm haddFilesForPlotting.sh~

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end=$(date +%s)
runtime=$(python -c "print '%u:%02u' % ((${end} - ${start})/60, (${end} - ${start})%60)")
echo $runtime
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%