FROM dawei/java

ENV JENKINS_VERSION 1.588
RUN mkdir /usr/share/jenkins/
RUN useradd -d /home/jenkins -m -s /bin/bash jenkins

RUN curl -L http://mirrors.jenkins-ci.org/war/$JENKINS_VERSION/jenkins.war -o /usr/share/jenkins/jenkins.war
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/cloudbees-folder.hpi -o  /tmp/WEB-INF/plugins/cloudbees-folder.hpi
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/job-dsl.hpi -o  /tmp/WEB-INF/plugins/job-dsl.hpi
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/scm-api.hpi -o  /tmp/WEB-INF/plugins/scm-api.hpi
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/git-client.hpi -o  /tmp/WEB-INF/plugins/git-client.hpi
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/git.hpi -o  /tmp/WEB-INF/plugins/git.hpi
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/simple-theme-plugin.hpi -o  /tmp/WEB-INF/plugins/simple-theme-plugin.hpi
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/bazaar.hpi -o  /tmp/WEB-INF/plugins/bazaar.hpi
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/groovy.hpi -o  /tmp/WEB-INF/plugins/groovy.hpi
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/docker-plugin.hpi -o  /tmp/WEB-INF/plugins/docker-plugin.hpi
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/docker-build-step.hpi -o  /tmp/WEB-INF/plugins/docker-build-step.hpi
RUN mkdir -p /tmp/WEB-INF/plugins && curl -L http://updates.jenkins-ci.org/latest/durable-task.hpi -o  /tmp/WEB-INF/plugins/durable-task.hpi

COPY init.groovy /tmp/WEB-INF/init.groovy

RUN cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/init.groovy WEB-INF/plugins/* && rm -rf /tmp/WEB-INF

ENV JENKINS_HOME /var/jenkins_home
RUN usermod -m -d "$JENKINS_HOME" jenkins && mkdir "$JENKINS_HOME/plugins"
ADD branding /var/jenkins_home/userContent
RUN chown -R jenkins "$JENKINS_HOME"
VOLUME /var/jenkins_home

# define url prefix for running jenkins behind Apache (https://wiki.jenkins-ci.org/display/JENKINS/Running+Jenkins+behind+Apache)
ENV JENKINS_PREFIX /
ENV JENKINS_AUTH none
ENV GIT_USERNAME jenkins
ENV GIT_EMAIL jenkins@localhost

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

USER jenkins
COPY seed.xml /tmp/seed.xml
COPY install_jdk.xml /tmp/install_jdk.xml

COPY jenkins.sh /usr/local/bin/jenkins.sh
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]