#!/bin/bash
sed -i.bak -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list

apt-get upgrade -y

# ansible install
apt-get update -qq
apt-get install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install ansible -y

# pip3 install
apt-get install python3-pip -y
pip3 install --upgrade pip

# docker module install
pip3 install docker
pip3 install docker-compose

# clone awx
git clone https://github.com/ansible/awx

exit
