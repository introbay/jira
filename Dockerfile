# Install Atlassian Jira
# This is a trusted build based on the "base" image
FROM ubuntu:14.04

MAINTAINER Ignacio López Flores ignacio@introbay.com

ENV AppName jira-core
ENV AppVer 7.2.3
ENV Arch x64

# Fetch the files
ADD https://downloads.atlassian.com/software/jira/downloads/atlassian-$AppName-$AppVer-$Arch.bin /opt/
ADD ./install_cmds.sh /install_cmds.sh
ADD ./response.varfile /opt/response.varfile
ADD ./init.sh /init.sh

## Now Install Atlassian Jira
RUN /install_cmds.sh

# Start the service
CMD ["sh", "/init.sh"]
EXPOSE 8080
VOLUME ["/opt/atlassian/jira-home"]
