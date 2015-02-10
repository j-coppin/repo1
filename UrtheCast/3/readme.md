# check_apache.sh

Shell script to check current apache process's.

  - Low Alert on less than 10 process's
  - Low alert on less than 20 process's
  - High alert on greater than 20 process's
  - Critical alert on greater than 100 process's
  - Service restart on greater than 100 process's
  - Daily logfile rotation using log4bash (http://code.google.com/p/log4bash/)

### Version
1.0.0

### Installation
* This script has been written to run on both RHEL and Ubuntu servers
* mkdir /opt/check_apache
* Upload script to /opt/check_apache
* Upload log4bash.conf and log4bash.core to /opt/check_apache

```sh
$ nohup ./check_apache.sh & > /dev/null 2>&1
```


