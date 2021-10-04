#!/bin/bash

read -p "Please Enter Path (example:../refined-data/data4__.csv): " DIR
read -p "Please Enter Sequence name (example:dataset-room1_512): " SEQ

if [ $DIR ] 
#DIR=$1
then
        cp "$DIR" ../datasets/tumvi_data/dataset-room1_512_16/mav0/imu0/data.csv

        basalt_vio --dataset-path ../datasets/tumvi_data/"$SEQ"_16/ --cam-calib /usr/etc/basalt/tumvi_512_ds_calib.json --dataset-type euroc --config-path /usr/etc/basalt/tumvi_512_config.json --marg-data tumvi_marg_data --show-gui 1 --save-trajectory trajectory

        #cp ../methods/basalt/f_"$SEQ"_monoi.csv ./

        python3 ../scripts/change_format_basalt.py "$SEQ" 

        evo_ape tum ./stamped_groundtruth.txt ./f_"$SEQ"_monoi.txt -va --plot

        evo_rpe tum ./stamped_groundtruth.txt ./f_"$SEQ"_monoi.txt -va --plot
else
        echo "No directory found!"
fi

