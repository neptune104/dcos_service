#!/bin/bash

echo "|              Service name             |  Status  | Msg |"
echo "|---------------------------------------|----------|-----|"
for i in $(ls /etc/systemd/system/dcos.target.wants/ -1 |grep -Ev "socket" |grep -Ev "timer"); do
        systemctl is-active --quiet $i && result="Active" || result="Inactive";

        if [ $result == "Active" ]; then
                echo -e "|  $i  | \e[1;32;40m  $result \e[0m |"
        else
                systemctl is-failed --quiet $i && result="Failed" || result="Inactive";
                #echo -e "|  $i  | $result |"
                if [ $result == "Inactive" ]; then
                        echo -e "|  $i  | $result |"
                else
                        echo -e "|  $i  | $result |"
                fi
        fi

done;
