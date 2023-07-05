#!/bin/bash -e
#!/bin/bash -e
#define variables to store info
version=5.5
# override the HEAP settings and run the jmeter script.
JVM_ARGS="-Xms512m -Xmx2048m" jmeter -n -t scenarios/databricks_tets_plan.jmx -l /jmeter.jtl 2>&1
java -jar /opt/apache-jmeter-${version}/lib/cmdrunner-2.3.jar --tool Reporter --plugin-type AggregateReport --input-jtl /jmeter.jtl --generate-csv /results/results.csv 2>&1
cat /results/results.csv
