FROM dawei/base

RUN	apt-get update
ENV	DEBIAN_FRONTEND noninteractive
RUN curl -L "https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.0.0-1_amd64.deb" -o /tmp/chef-server.deb && dpkg -i /tmp/chef-server.deb

# RUN	sysctl -w kernel.shmall=4194304 && sysctl -w kernel.shmmax=17179869184
RUN	/opt/opscode/embedded/bin/runsvdir-start & \
	chef-server-ctl reconfigure && \
	chef-server-ctl stop

COPY run.sh /usr/local/bin/
CMD	["run.sh"]

EXPOSE	443
