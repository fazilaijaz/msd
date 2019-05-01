#!/usr/bin/bash

timestamp=$(date +%Y-%m-%d' '%H:%M:%S)
echo " $timestamp : run_spark script started."

#run spark app to calculate the average
spark2-submit --conf spark.yarn.executor.memoryOverhead=4096 --executor-memory 4G --driver-memory 4G --executor-cores 4 --driver-cores 4 --conf spark.default.parallelism=12 spark_app.py

#extract data to local for visualization
hive -e 'set hive.cli.print.header=true; select * from msd.nutrition' | sed 's/[\t]/|/g' > visualization/nutrition.csv
hive -e 'set hive.cli.print.header=true; select * from msd.data_value_by_year_age' | sed 's/[\t]/|/g'  > visualization/data_value_by_year_age.csv
hive -e 'set hive.cli.print.header=true; select * from msd.data_value_by_year_female' | sed 's/[\t]/|/g' > visualization/data_value_by_year_female.csv

echo " $timestamp : run_spark script finished."