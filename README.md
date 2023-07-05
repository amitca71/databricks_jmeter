# databricks_jmeter   
build:    
docker build -t databricks-jmeter-docker:latest .   
execute:   
prerequisite: jmx scenario under scenarios dir (can change the xxx on the existing file for example)   

docker run -it --rm -v $(pwd)/output:/results -v $(pwd)/scenarios:/opt/apache-jmeter-5.5/scenarios databricks-jmeter-docker:latest run.sh   




jmeter create scenario instructions 

Jmeter for databricks sql

pre requisite: 
1. Databricks workspace with:
- SQL Warehouse installed
- generated private token



1. install latest jmeter https://jmeter.apache.org/download_jmeter.cgi
2. download databricks client lib from: https://www.databricks.com/spark/jdbc-drivers-archive
3. copy the driver  (e.g. DatabricksJDBC42.jar) to lib/ext
4. boot (./bin/jmeter)
5. add  DatabricksJDBC42.jar to classpath (press on browse and select it)
![image](https://github.com/amitca71/databricks_jmeter/assets/5821916/c3581315-bfa3-4e78-9e8a-c8ab2a0cfbb5)


6. Add JDBC configuration:

![image](https://github.com/amitca71/databricks_jmeter/assets/5821916/8b7ae80e-8f93-47ff-a34e-d125da225876)


fill similar to the following:
![image](https://github.com/amitca71/databricks_jmeter/assets/5821916/c335d625-b799-4af1-a6e6-616a1749737e)

where 
JDBC Driver Class = com.databricks.client.jdbc.Driver
database URL:  taken from the sql endpoint connecyion details
connection propeties: PWD=<your token>


7. Add thread group
![image](https://github.com/amitca71/databricks_jmeter/assets/5821916/52190602-dc40-4598-aeff-c5a8553d9b67)

under thread group:

7.1 Add sampler→ JDBC Request

![image](https://github.com/amitca71/databricks_jmeter/assets/5821916/306d1cfd-0016-4930-bec0-125e60fa132b)


with following input :
![image](https://github.com/amitca71/databricks_jmeter/assets/5821916/9abf25d8-bd7c-4cd6-a9fd-1581154fd5c6)

variable name of pool… : databricks (the one we declared before)
query: the query (in this example: “show schemas”)

under JDBC request:
7.1.1 add listener:
![image](https://github.com/amitca71/databricks_jmeter/assets/5821916/13616ec4-0974-411e-83f1-adb92af87a49)

save… and execute.

Green ones mean successfull executions
![image](https://github.com/amitca71/databricks_jmeter/assets/5821916/6c0e2a7d-34db-416a-8db5-a7225988bd18)



