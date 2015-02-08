# check_apache.sh

Shell script to check current apache process's.

  - Low Alert on less than 10 process's
  - Low alert on less than 20 process's
  - High alert on greater than 20 process's
  - Critical alert on greater than 100 process's
  - Service restart on greater than 100 process's

### Version
1.0.0

### Installation
* This script has been written to run on both RHEL and Ubuntu servers
* Copy script to path, /usr/local/bin or ~/bin

```sh
$ check_apache.sh
```


