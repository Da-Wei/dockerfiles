FROM	ubuntu:14.04

RUN	apt-get update
ENV	DEBIAN_FRONTEND noninteractive

RUN	apt-get install -yq curl
RUN	curl -L "https://packagecloud.io/chef/stable/download?distro=precise&filename=chef-server-core_12.0.0-rc.5-1_amd64.deb" -o /tmp/chef-server.deb
RUN	dpkg -i /tmp/chef-server.deb

RUN	dpkg-divert --local --rename --add /sbin/initctl
RUN	ln -sf /bin/true /sbin/initctl

# RUN	sysctl -w kernel.shmall=4194304 && sysctl -w kernel.shmmax=17179869184
RUN	/opt/opscode/embedded/bin/runsvdir-start & \
	chef-server-ctl reconfigure && \
	chef-server-ctl stop

ADD	. /usr/local/bin/
CMD	["run.sh"]

EXPOSE	443
