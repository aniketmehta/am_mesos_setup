#!/bin/bash

thisserverip="$(hostname -i)"
echo "this server ip: ${thisserverip}"

server_quorum=2

echo " Please Type 
    1 (Start Installation based on configuration file)" 
    
read input


if [ $input == 1 ]
then
  file="./configuration.txt"

  if [[ -f $file ]];
  then
  	while read -r line
  	do
   		read -ra words <<< ${line}
   		if [ "$thisserverip" == "$words" ]
		then
   			if [ 'master' == "${words[1]}"]
   			then
   				echo "master found ID: "${words[2]}
   				master=1
   			elif ['slave' == "${words[1]}"]
   			then 
   				echo "slave found"
   				master=0
   			else
   				echo "This host is not listed in configuraion file. Please check the error. This Host: ${thisserverip}"	
   			fi 
        fi 
 	done <configuration.txt

  else
   echo "configuration.txt file not found. Configuration file is created for you. Please take a look at update it accordingly."
   echo '192.168.0.1 master 1
	192.168.0.2 master 2
	192.168.0.3 master 3
	192.168.0.4 slave
	192.168.0.5 slave' >> configuration.txt
  fi
fi

	# echo "Enter IP address for master 1: "
	# read server_ip_1
	
	# echo "Enter ID for master 1 (1 to 255): "
	# read server_id_1
	
	# echo "Enter IP address for master 2: "
	# read server_ip_2
	
	# echo "Enter ID for master 2 (1 to 255): "
	# read server_id_2
	
	# echo "Enter IP address for master 3: "
	# read server_ip_3
	
	# echo "Enter ID for master 3 (1 to 255): "
	# read server_id_3
	
	echo '
	--------------------------------------------------
	--------------------------------------------------
	--------------------------------------------------'
	
	echo "Mesos common files installation started.:"
	
	echo '
	--------------------------------------------------
	--------------------------------------------------
	--------------------------------------------------'
	##common items for both master and slave.
	
	#apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]') CODENAME=$(lsb_release -cs)
	 
	#echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list
	
	#apt-get -y update
	
	echo '
	--------------------------------------------------
	--------------------------------------------------
	--------------------------------------------------'
	
	echo -n "Mesos common files installation done.:"
	
	echo '
	--------------------------------------------------
	--------------------------------------------------
	--------------------------------------------------'
	
if [ $master eq 1 ]
then 
    echo '
	--------------------------------------------------
	--------------------------------------------------
	--------------------------------------------------'
	echo "starting master setup:"
	
    echo '
	--------------------------------------------------
	--------------------------------------------------
	--------------------------------------------------'
	
	## Mesos master setup now.
	
	#sudo apt-get install mesosphere
	
	#echo "zk://"${server_ip_1}":2181,"${server_ip_2}":2181,"${server_ip_3}":2181/mesos" | tee /etc/mesos/zk
	
	#if [ "$thisserverip" == "$server_ip_1" ]
	#then
		echo $server_id_1 | tee /etc/zookeeper/conf/myid		
	#elif [ "$thisserverip" == "$server_ip_2" ]
	#then
	#	echo $server_id_2 | tee /etc/zookeeper/conf/myid
	#elif [ "$thisserverip" == "$server_ip_3" ]
	#then
	#	echo $server_id_3 | tee /etc/zookeeper/conf/myid
	#fi
	
	#echo "server."${server_id_1}"="${server_ip_1}":2888:3888" | tee -a /etc/zookeeper/conf/zoo.cfg
	#echo "server."${server_id_2}"="${server_ip_2}":2888:3888" | tee -a /etc/zookeeper/conf/zoo.cfg
	#echo "server."${server_id_3}"="${server_ip_3}":2888:3888" | tee -a /etc/zookeeper/conf/zoo.cfg
	
	#echo ${server_quorum} | tee /etc/mesos-master/quorum
	
	#echo ${thisserverip} | tee /etc/mesos-master/ip
	
	#cp /etc/mesos-master/ip /etc/mesos-master/hostname
	
	#mkdir -p /etc/marathon/conf
	
	#cp /etc/mesos-master/hostname /etc/marathon/conf
	
	#cp /etc/mesos/zk /etc/marathon/conf/master
	
	#cp /etc/marathon/conf/master /etc/marathon/conf/zk
	
	#echo "zk://"${server_ip_1}":2181,"${server_ip_2}":2181,"${server_ip_3}":2181/marathon" | tee /etc/marathon/conf/zk
	
	#stop mesos-slave
	
	#echo manual | sudo tee /etc/init/mesos-slave.override
	
	#restart zookeeper
	
	#start mesos-master
	
	#start marathon

elif [ $master eq 0 ]

    echo '
	--------------------------------------------------
	--------------------------------------------------
	--------------------------------------------------'
	
	echo "starting slave setup:"

    echo '
	--------------------------------------------------
	--------------------------------------------------
	--------------------------------------------------'
	
	##Slave set up now.
	
	#apt-get install mesos
	
	#echo "zk://"${server_ip_1}":2181,"${server_ip_2}":2181,"${server_ip_3}":2181/mesos" | tee /etc/mesos/zk
	
	#stop zookeeper
	#echo manual | sudo tee /etc/init/zookeeper.override
	
	#echo manual | sudo tee /etc/init/mesos-master.override
	#stop mesos-master
	
	#echo ${thisserverip} | sudo tee /etc/mesos-slave/ip
	#cp /etc/mesos-slave/ip /etc/mesos-slave/hostname
	
	#start mesos-slave

fi