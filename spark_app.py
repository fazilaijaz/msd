from pyspark.sql import SQLContext
from pyspark import SparkConf, SparkContext
from pyspark.sql.types import *
from pyspark.sql import *
from datetime import datetime
conf = SparkConf().setAppName("Data_Value by year for all age groups")
sc = SparkContext(conf=conf)
queryContext = HiveContext(sc)
queryContext.sql("""use msd""")
data_value_by_year_age= """select yearstart,yearend,age,AVG(data_value) as data_value_average from msd.nutrition group by yearstart,yearend,age"""
data_value_by_year_female= """select yearstart,yearend,AVG(data_value) as data_value_average,gender from msd.nutrition where gender='Female' group by yearstart,yearend,gender"""
print(data_value_by_year_age)
print(data_value_by_year_female)
query1=queryContext.sql(data_value_by_year_age)
query1.printSchema
query1.write.format("orc").option("orc.compress","SNAPPY").mode("overwrite").saveAsTable("msd.data_value_by_year_age")
query2=queryContext.sql(data_value_by_year_female)
query2.write.format("orc").option("orc.compress","SNAPPY").mode("overwrite").saveAsTable("msd.data_value_by_year_female")
print("Completed")