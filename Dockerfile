# Set the base image
FROM opensuse

# Dockerfile author / maintainer 
MAINTAINER Saurabh Pandit <saurabh201189@gmail.com>

# Update any module whose update are available
RUN zypper --non-interactive up

# Adding oracle install file to tmp folder
ADD oracle-instantclient*.rpm /tmp/

# Installing oracle instant client
RUN rpm -ivh /tmp/oracle-instantclient*.rpm && \
    rm -rf /var/cache/zypp && \
    rm -f /tmp/oracle-instantclient*.rpm && \
    echo /usr/lib/oracle/12.2/client64/lib > /etc/ld.so.conf.d/oracle-instantclient12.2.conf && ldconfig && \
    echo 'export LD_LIBRARY_PATH="/usr/lib/oracle/12.2/client64/lib";export ORACLE_HOME="/usr/lib/oracle/12.2/client64/lib";' > /etc/bash.bashrc.local