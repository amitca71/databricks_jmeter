#!/bin/bash -e
#!/bin/bash -e
#define variables to store info
version=5.5
PARAM_HOSTS_ARGS="-Jhost=${host} -JPWD=${pwd} -Jwarehouse=${warehouse} -Jport=${port} -Jthreads=${threads} -Jduration=${duration} -Jrampup=${rampup} -Jjmx=${JMX} -Jdriver=${driver} -Jquery=${query}"
echo $PARAM_HOSTS_ARGS
# override the HEAP settings and run the jmeter script.
#JVM_ARGS="-Xms512m -Xmx2048m" jmeter -n -t scenario/${JMX} -l /jmeter.jtl  2>&1
jmeter -n -t scenario/${JMX} -l /jmeter.jtl ${PARAM_HOSTS_ARGS}
java -jar /opt/apache-jmeter-${version}/lib/cmdrunner-2.3.jar --tool Reporter --plugin-type AggregateReport --input-jtl /jmeter.jtl --generate-csv /results/results.csv 2>&1
cat /results/results.csv
