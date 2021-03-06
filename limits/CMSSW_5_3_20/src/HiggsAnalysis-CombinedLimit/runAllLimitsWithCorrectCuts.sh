ini6
cmsenv

massTable=("100" "200" "300" "400" "500")   #please specifiy in GeV
decaywidthTable=("1" "5" "10" "50" "100")   #please specifiy in cm


filenameIn="datacardsSelectedUnblinded"
mkdir logFiles/${filenameIn}
mkdir limits/${filenameIn}
mkdir limits/${filenameIn}_xsec
for ctau in "${decaywidthTable[@]}"
do
    echo "ctau = " $ctau
    for mass in "${massTable[@]}"
    do
	echo "mass = " $mass


	datacardName=$(find ${filenameIn}/ -name "*mass_${mass}GeV_ctau_${ctau}cm.txt" )
	
	#combine -M Asymptotic --run expected -C 0.95 -t -1 --minimizerStrategy 2 ${datacardName} > logFiles/${filenameIn}/res_mass_${mass}GeV_ctau_${ctau}cm.log
	combine -M Asymptotic -C 0.95   --minimizerStrategy 2  ${datacardName} > logFiles/${filenameIn}/res_mass_${mass}GeV_ctau_${ctau}cm.log
	cat logFiles/${filenameIn}/res_mass_${mass}GeV_ctau_${ctau}cm.log

	echo ""
	echo ""

    done
    root -l -b -q plot_limit_WithCorrectCuts.cc+"(\"${filenameIn}\", ${ctau})"
    mv test_ctau${ctau}cm.pdf limits/${filenameIn}/LimitPlot_ctau${ctau}cm.pdf
    root -l -b -q plot_limit_xsec.cc+"(\"${filenameIn}\", ${ctau})"
    mv test_ctau${ctau}cm.pdf limits/${filenameIn}_xsec/LimitPlot_ctau${ctau}cm.pdf
done

rm *.root
rm *.~





