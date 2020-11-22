#! /bin/bash
useradd anna
useradd pere
useradd pau
echo "anna" | passwd --stdin anna
echo "pere" | passwd --stdin pere
echo "pau" | passwd --stdin pau
cp /opt/docker/login.defs /etc/login.defs
