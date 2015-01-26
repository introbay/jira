#!/bin/bash
#set -x
# Install Atlassian Jira
## Install Java
# Add Oracle Java PPA
#apt-get -y update
#apt-get -y install python-software-properties
#add-apt-repository -y ppa:webupd8team/java
apt-get -y update
# Auto-accept the Oracle License
#echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
#echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
#apt-get -y install libpq-dev oracle-java7-installer

## Now Install Atlassian Jira
sh /opt/atlassian-$AppName-$AppVer-$Arch.bin -q -varfile /opt/response.varfile

# Clean up
#rm -f /var/cache/oracle-jdk7-installer/jdk-7u45-linux-x64.tar.gz
rm -f /opt/atlassian-$AppName-$AppVer-$Arch.bin
