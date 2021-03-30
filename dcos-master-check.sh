#!/bin/bash

for i in $(ls /etc/systemd/system/dcos.target.wants/ -1 |grep -Ev "socket" |grep -Ev "timer"); do echo $i; systemctl status $i |grep Active ; done;
