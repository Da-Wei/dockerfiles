FROM dawei/base

RUN	apt-get update
ENV	DEBIAN_FRONTEND noninteractive

RUN	curl -L "https://packagecloud.io/chef/stable/download?distro=precise&filename=chef-server-core_12.0.0-rc.5-1_amd64.deb" -o /tmp/chef-server.deb && dpkg -i /tmp/chef-server.deb

# RUN	sysctl -w kernel.shmall=4194304 && sysctl -w kernel.shmmax=17179869184
RUN	/opt/opscode/embedded/bin/runsvdir-start & \
	chef-server-ctl reconfigure && \
	chef-server-ctl stop

COPY run.sh /usr/local/bin/
CMD	["run.sh"]

EXPOSE	443
