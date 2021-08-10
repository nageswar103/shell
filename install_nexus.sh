# #!/bin/bash
# cd /opt
# wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
# sudo wget http://download.sonatype.com/nexus/3/nexus-3.15.2-01-unix.tar.gz
# tar -zxvf nexus-3.15.2-01-unix.tar.gz
# mv /opt/nexus-3.15.2-01 /opt/nexus
# useradd nexus
# cat <<EOT> /etc/sudoers
# root    ALL=(ALL)         ALL
# nexus   ALL=(ALL)         NOPASSWD:ALL
# EOT

# chmod -R 775 /opt/nexus
# chmod -R 775 /opt/sonatype-work
# chown -R nexus:nexus /opt/nexus
# chown -R nexus:nexus /opt/sonatype-work
# cat <<EOT> /opt/nexus/bin/nexus.rc
# run_as_user="nexus"
# EOT

# ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
# su - nexus
# systemctl start nexus.service
# systemctl enable nexus.service
# systemctl status nexus.service



#!/bin/bash
cd /opt
#download  java with wget
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
#install java with rpm 
rpm -ivh jdk-8u131-linux-x64.rpm 
#check java version
java -version
#download nexus
wget http://download.sonatype.com/nexus/3/nexus-3.15.2-01-unix.tar.gz
#unzip the nexus
tar -zxvf nexus-3.15.2-01-unix.tar.gz
#rename  the nexus
mv /opt/nexus-3.15.2-01 /opt/nexus
#now adduser nexus
useradd nexus
#in visudo some change is requeried 
cat <<EOT> /opt/visudo 
root    ALL=(ALL)       ALL
nexus   ALL=(ALL)       NOPASSWD:ALL
EOT
#change  permission
chmod -R 775 /opt/nexus
chmod -R 775 /opt/sonatype-work

#change owner permission
chown -R nexus:nexus /opt/nexus
chown -R nexus:nexus /opt/sonatype-work
#go to the visudo some changes is required
cat <<EOT> /opt/nexus/bin/nexus.rc
run_as_user="nexus"
EOT
#Create nexus as a service
ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
#switch as nexus user 
su - nexus
#enable and start the service 
systemctl start nexus.service
systemctl enable nexus.service
systemctl status nexus.service
