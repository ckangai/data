from pyspark import SparkContext

BUCKET="qwiklabs-gcp-4b96f78a53710a71"

sc = SparkContext("local", "Process Orders")

order_lines = sc.textFile("gs://BUCKET/OrderDetails.csv").filter(lambda str: not str.startswith('OrderID'))
# for line in order_lines.take(5):
#     print(line)

rdd1 = order_lines.map(lambda line: line.split(",")).map(lambda flds: (flds[0], float(flds[5]))).reduceByKey(lambda x1, x2: x1 + x2).sortByKey()
# print(rdd1.count())
finalrdd = rdd1.map(lambda x: ','.join(str(s) for s in x))
finalrdd.saveAsTextFile("gs://BUCKET/results")