#! /bin/bash

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_USERNAME}"

#mkdir -p /var/jenkins_home/updates
#curl -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' > /var/jenkins_home/updates/default.j
# if `docker run` first argument start with `--` the user is passing jenkins launcher arguments
if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
  exec java $JAVA_OPTS -jar /usr/share/jenkins/jenkins.war $JENKINS_OPTS --prefix=$JENKINS_PREFIX "$@"
fi
# As argument is not jenkins, assume user want to run his own process, for sample a `bash` shell to explore this image
exec "$@"