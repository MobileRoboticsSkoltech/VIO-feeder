#!/bin/bash

read -p "Please Enter Path (example:../refined-data/data4__.csv): " DIR
read -p "Please Enter Sequence name (example:dataset-room1_512): " SEQ

if [ $DIR ] 
#DIR=$1
then
	cp "$DIR" ../methods/ORB_SLAM3/Examples/Monocular-Inertial/TUM_IMU/"$SEQ".txt

	../methods/ORB_SLAM3/Examples/Monocular-Inertial/mono_inertial_tum_vi ../methods/ORB_SLAM3/Vocabulary/ORBvoc.txt ../methods/ORB_SLAM3/Examples/Monocular-Inertial/TUM_512.yaml ../datasets/tumvi_data/"$SEQ"_16/mav0/cam0/data ../methods/ORB_SLAM3/Examples/Monocular-Inertial/TUM_TimeStamps/"$SEQ".txt ../methods/ORB_SLAM3/Examples/Monocular-Inertial/TUM_IMU/"$SEQ".txt "$SEQ"_monoi

	cp ../methods/ORB_SLAM3/Examples/f_"$SEQ"_monoi.txt ./

	python3 ../scripts/change_format.py "$SEQ"

	evo_ape tum ./stamped_groundtruth.txt ./f_"$SEQ"_monoi.txt -va --plot

	evo_rpe tum ./stamped_groundtruth.txt ./f_"$SEQ"_monoi.txt -va --plot
else
	echo "No directory found!"
fi
