# ETL Demonstration

## Getting Started

To demonstrate skillset of ETL, Hive and Spark. Develop automation pipeline to ingest and calculate data in BigData Platform.

### Prerequisites

- Windows machine with 16 GB RAM and 12 cores CPU
- java version 1.8.0

### Installing and Testing the setup

Follow the (doc/Setup_hadoop_environment.docx) guide to setup the hortonworks sandbox using VM Player on windows.

## Running the scripts

- Run Sandbox Hortonworks Sandbox through VM Player Open SSH connection to VM in Browser on port 4200.
(example : 192.168.122.128:4200)
- Login using maria_dev

- Clone or download
https://github.com/fazilaijaz/msd.git

- Run Data ingestion in hadoop and hive
```sh load_data.sh```

- Run spark data aggregation and store result in hive
```sh run_spark.sh```

- Run Data Visualization
Navigate to "Visualization" directory in windows. Open ```index.html``` with **Firefox**. Click on the relevant buttons to display required data.

## Built With

* [Hortonworks Sandbox](https://www.cloudera.com/downloads/hortonworks-sandbox/hdp.html) - Complete Hadoop Environment as a sandbox
* [VM Player](https://www.vmware.com/my/products/workstation-player/workstation-player-evaluation.html) - To run Hortonworks Sandbox
* [APACHE SPARK](https://spark.apache.org/) - Distributed Execution Framework

## Authors

Fazil Aijaz
