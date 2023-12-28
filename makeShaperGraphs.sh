#!bin/bash

#vars
i=1
resonances=(/tmp/*.csv)
graphFolder=~/inputshaperGraphs/
desktopFolder=codiecottrell@192.168.12.147:~/Desktop/ResonanceShit/

## ask user for which file to get a graph for 'latest' or specific file
for file in ${resonances[*]}
do
	echo $i". "$file
	fileList[i]=$file
	i=$((i+1))
done

echo "enter the number of the file you would like to graph? "
read fileToGraph

## ask user for smoothing limit
echo "define a max smoothing, enter 0 to run defaults: "
read maxSmoothing

if [ $maxSmoothing -gt 0 ];
then
	smoothing="--max_smoothing="$maxSmoothing
else
	smoothing=""
fi

## grab input for the name of the graph png
echo "name the graph: "
read graphName

## run the python file and save the file into folder in the home folder
echo "graphing the resonance data with the following command: "
echo "~/klipper/scripts/calibrate_shaper.py ${fileList[$fileToGraph]} -o  $graphFolder$graphName $smoothing"

~/klipper/scripts/calibrate_shaper.py ${fileList[$fileToGraph]} -o  $graphFolder$graphName $smoothing

