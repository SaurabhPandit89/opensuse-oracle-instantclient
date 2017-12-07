# Set the base image
FROM opensuse

# Dockerfile author / maintainer 
MAINTAINER Saurabh Pandit <saurabh201189@gmail.com>

RUN zypper --non-interactive up

# Added required utilities to the image
# RUN zypper --non-interactive ar http://download.opensuse.org/repositories/devel:libraries:c_c++/openSUSE_Leap_42.2/devel:libraries:c_c++.repo
RUN zypper --non-interactive ar http://download.opensuse.org/repositories/home:ecsos/openSUSE_Leap_42.2/home:ecsos.repo

# Refresh the repo
RUN zypper --no-gpg-checks refresh

# Install oracle instant client
# RUN zypper --non-interactive install curl
RUN zypper --non-interactive install oracle-instantclient