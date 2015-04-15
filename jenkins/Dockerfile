FROM dawei/java

ENV JENKINS_VERSION latest
RUN mkdir /usr/share/jenkins/
RUN useradd -d /home/jenkins -m -s /bin/bash jenkins

RUN curl -L http://mirrors.jenkins-ci.org/war/$JENKINS_VERSION/jenkins.war -o /usr/share/jenkins/jenkins.war
RUN mkdir -p /tmp/WEB-INF/plugins
RUN curl -L http://updates.jenkins-ci.org/latest/cloudbees-folder.hpi -o  /tmp/WEB-INF/plugins/cloudbees-folder.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/job-dsl.hpi -o  /tmp/WEB-INF/plugins/job-dsl.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/scm-api.hpi -o  /tmp/WEB-INF/plugins/scm-api.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/git-client.hpi -o  /tmp/WEB-INF/plugins/git-client.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/git.hpi -o  /tmp/WEB-INF/plugins/git.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/simple-theme-plugin.hpi -o  /tmp/WEB-INF/plugins/simple-theme-plugin.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/bazaar.hpi -o  /tmp/WEB-INF/plugins/bazaar.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/groovy.hpi -o  /tmp/WEB-INF/plugins/groovy.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/docker-plugin.hpi -o  /tmp/WEB-INF/plugins/docker-plugin.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/docker-build-step.hpi -o  /tmp/WEB-INF/plugins/docker-build-step.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/durable-task.hpi -o  /tmp/WEB-INF/plugins/durable-task.hpi

RUN curl -L http://updates.jenkins-ci.org/latest/workflow-aggregator.hpi -o  /tmp/WEB-INF/plugins/workflow-aggregator.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/workflow-api.hpi -o  /tmp/WEB-INF/plugins/workflow-api.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/workflow-basic-steps.hpi -o  /tmp/WEB-INF/plugins/workflow-basic-steps.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/workflow-cps.hpi -o  /tmp/WEB-INF/plugins/workflow-cps.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/workflow-cps-global-lib.hpi -o  /tmp/WEB-INF/plugins/workflow-cps-global-lib.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/workflow-durable-task-step.hpi -o  /tmp/WEB-INF/plugins/workflow-durable-task-step.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/workflow-job.hpi -o  /tmp/WEB-INF/plugins/workflow-job.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/workflow-scm-step.hpi -o  /tmp/WEB-INF/plugins/workflow-scm-step.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/workflow-step-api.hpi -o  /tmp/WEB-INF/plugins/workflow-step-api.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/workflow-support.hpi -o  /tmp/WEB-INF/plugins/workflow-support.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/script-security.hpi -o  /tmp/WEB-INF/plugins/script-security.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/git-server.hpi -o  /tmp/WEB-INF/plugins/git-server.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/mapdb-api.hpi -o  /tmp/WEB-INF/plugins/mapdb-api.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/extended-choice-parameter.hpi -o  /tmp/WEB-INF/plugins/extended-choice-parameter.hpi 
RUN curl -L http://updates.jenkins-ci.org/latest/git-parameter.hpi -o  /tmp/WEB-INF/plugins/git-parameter.hpi 
RUN curl -L http://updates.jenkins-ci.org/latest/ruby-runtime.hpi -o  /tmp/WEB-INF/plugins/ruby-runtime.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/commit-message-trigger-plugin.hpi -o  /tmp/WEB-INF/plugins/commit-message-trigger-plugin.hpi

COPY init.groovy /tmp/WEB-INF/init.groovy

RUN cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/init.groovy WEB-INF/plugins/* && rm -rf /tmp/WEB-INF

ENV JENKINS_HOME /var/jenkins_home
RUN usermod -m -d "$JENKINS_HOME" jenkins && mkdir "$JENKINS_HOME/plugins"
ADD branding /var/jenkins_home/userContent
RUN chown -R jenkins "$JENKINS_HOME"
VOLUME /var/jenkins_home

RUN apt-get update && apt-get -y install openssh-client
RUN wget --no-check-certificate -q  https://raw.github.com/petervanderdoes/gitflow/develop/contrib/gitflow-installer.sh && bash gitflow-installer.sh install stable; rm gitflow-installer.sh

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