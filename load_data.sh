#!/usr/bin/bash

timestamp=$(date +%Y-%m-%d' '%H:%M:%S)
echo " $timestamp : load_data script started."

wget "https://chronicdata.cdc.gov/views/735e-byxc/rows.csv"

hive -e "CREATE DATABASE IF NOT EXISTS msd;

hive -e "CREATE EXTERNAL TABLE IF NOT EXISTS msd.nutrition(YearStart INT,YearEnd INT,LocationAbbr STRING,LocationDesc STRING,Datasource STRING,Class STRING,Topic STRING,Question STRING,Data_Value_Unit STRING,Data_Value_Type STRING,Data_Value FLOAT,Data_Value_Alt FLOAT,Data_Value_Footnote_Symbol STRING,Data_Value_Footnote STRING,Low_Confidence_Limit FLOAT,High_Confidence_Limit  FLOAT,Sample_Size FLOAT,Total STRING,Age STRING,Gender STRING,Race STRING,GeoLocation STRING,ClassID STRING,TopicID STRING,QuestionID STRING,DataValueTypeID STRING,LocationID INT,StratificationCategory1 STRING,Stratification1 STRING,StratificationCategoryId1 STRING,StratificationID1 STRING) COMMENT 'Nutrition__Physical_Activity__and_Obesity_-_Women__Infant__and_Child' ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' STORED AS TEXTFILE location '/data/nutrition' TBLPROPERTIES ('skip.header.line.count' = '1')"

hive -e "LOAD DATA LOCAL INPATH 'rows.csv' OVERWRITE INTO TABLE msd.nutrition;"

timestamp=$(date +%Y-%m-%d' '%H:%M:%S)
echo " $timestamp : load_data script finished."