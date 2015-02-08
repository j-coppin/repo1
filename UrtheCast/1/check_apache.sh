#!/bin/bash

OS=`lsb_release -si`
if [ $OS == "RedHatEnterpriseServer" ]; then
    program="httpd"
elif [ $OS == "Ubuntu" ]; then
    program="apache2"
fi


function service_restart ()
{
    service $program restart
}

function check_proc () 
{
proc_count=`pidof $program | wc -w`
if [ $proc_count -gt 100 ]; then
    printf "[CRITICAL] Web Server under heavy load, restart required"
    service_restart
elif [ $proc_count -gt 20 ]; then
    printf "[HIGH] Web Server Working hard!\n"
elif  [ $proc_count -lt 20 ]; then
    printf "[LOW] Web Server OK!\n"
elif  [ $proc_count -lt 10 ]; then
    printf "[LOW] Web Server OK!\n"
fi

}

while :
do
    check_proc
    sleep 30
done

