#!bin/bash

rm results.txt

mass=("100" "200" "300" "400" "500")
ctau=("1" "5" "10" "50" "100") 
printTitle=1
inputfolder="datacardsUnblinded"
for ct in "${ctau[@]}"
  do
    for m in "${mass[@]}"
    do
	#echo "m="$m
	#echo "ctau="$ct

	python determineBestCuts.py  "${m}" "${ct}" ${printTitle} ${inputfolder}
	printTitle=0

    done
done

printTitle=1
for ct in "${ctau[@]}"
  do
    for m in "${mass[@]}"
    do
	#echo "m="$m
	#echo "ctau="$ct

	python determineBestCutsOutOf4Sets.py  "${m}" "${ct}" ${printTitle} ${inputfolder}
	printTitle=0

    done
done


