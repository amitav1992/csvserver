Step 1) docker pull infracloudio/csvserver:latest

Step 2) docker run -d infracloudio/csvserver

Step 3) docker ps -a

CONTAINER ID   IMAGE                    COMMAND                  CREATED          STATUS                     PORTS                                       NAMES
22d955106327   infracloudio/csvserver   "/csvserver/csvserver"   8 seconds ago    Exited (1) 6 seconds ago                                               hungry_jepsen

step 4) docker logs 22d9
2021/06/01 17:15:56 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

Explanation: The application is trying to read the file /csvserver/inputdata which is not there, We need to somehow make the file available.

step 5) Create a script gencsv.sh

step 6) It generates the inputFile

step 7) to make the inputdata file available we map the path of inputFile on the host to /csvserver/inputdata path on the container

docker run -d -v <your working directory>/solution/inputFile:/csvserver/inputdata infracloudio/csvserver

step 8) to get the shell access to container 
docker exec -it <container_id> /bin/bash

[root@352b89c6a959 csvserver]# ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 16:30 ?        00:00:00 /csvserver/csvserver
root        11     0  0 17:27 pts/0    00:00:00 bash
root        26    11  0 17:28 pts/0    00:00:00 ps -ef

[root@352b89c6a959 csvserver]# netstat -napt
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver

We get the port for application as 9300

Step 9 ) We need to expose the forward the service on 9393 port for the host and set the border color as orange.

docker run -d -e CSVSERVER_BORDER=Orange -v <your working directory>/solution/inputFile:/csvserver/inputdata -p 9393:9300 infracloudio/csvserver

step 10) launch http://localhost:9393

###################################################################################################################################################################################
                                                                                   Part 2
										   =======

Step1) Create a docker compose file 

step 2 ) ensure all the file are ther in the rpository

step 3) run docker compose up -d(for the detached mode)

step4) validate by http://localhost:9393

################################################################################################################################################################################
