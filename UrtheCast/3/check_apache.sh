#!/bin/bash

OS=`lsb_release -si`
if [ $OS == "RedHatEnterpriseServer" ]; then
    program="httpd"
elif [ $OS == "Ubuntu" ]; then
    program="apache2"
fi
. ./log4bash.core

function service_restart ()
{
    service $program restart
}

function check_proc () 
{
proc_count=`pidof $program | wc -w`
if [ $proc_count -gt 100 ]; then
    log.fatal "[CRITICAL] Web Server under heavy load, restart required" 
    service_restart
elif [ $proc_count -gt 20 ]; then
    log.warn "[HIGH] Web Server Working hard!" 
elif  [ $proc_count -lt 20 ]; then
    log.info "[LOW] Web Server OK!"
elif  [ $proc_count -lt 10 ]; then
    log.info "[LOW] Web Server OK!"
fi

}

while :
do
    check_proc
    sleep 30
done

