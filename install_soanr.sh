# sonarqube shell script
 #   pre - req :
 #              Amazon-linux
#               4 CPU and 4 GB 
#               port =9000





#!/bin/bash
cd /opt
#download  java using wget
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
#install java use the rpm 
rpm -ivh jdk-8u131-linux-x64.rpm 
#check java version
java -version
#download sonarqube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
#unzip the sonarqube
unzip sonarqube-7.8.zip 

#now adduser sonar
useradd sonar
#go to the visudo some changes is required
cat <<EOT> /etc/sudoers
root    ALL=(ALL)       ALL
sonar   ALL=(ALL)       NOPASSWD:ALL
EOT
#change sonarqube permission
chmod -R 775 /opt/sonarqube-7.8/
#change owner permission
chown -R sonar:sonar sonarqube-7.8/
#go to sonar user
su - sonar
# go to sonarqube
cd /opt/sonarqube-7.8/bin/linux-x86-64
sh sonar.sh start




