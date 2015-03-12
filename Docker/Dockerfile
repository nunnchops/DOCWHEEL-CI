# soe-cii openshift-jenkins-mock-httpd
#
# This image provides a Jenkins-mock-cii server, primarily intended for integration with
# OpenShift v3.
# 
# based on James Rawlings Fabric8 Jenkins image and 
# bparees jenins-1-centos: https://github.com/openshift/jenkins-1-centos
# Thanks also to Laurent Dombs excellent fork of the SOE-CI master branch 
# that includes the original SOE Jenkins installer scripts from which I used the
# a variation of the wget command for Jenkins config.xml
#
# rnunn@redhat.com
#
#
# The aim is to provide a DocWheel-CI Jenkins orchestration image 
# pre-configured in an Openshift ready Docker container. This needs 
# refinement though and testing   
#

#FROM openshift/origin
#rebasing to James Rawlings Fabric8 Jenkins
FROM rawlingsj/fabric8-jenkins

USER root

#### JENKINS AND REPO
ENV HOME /var/jenkins_home
ENV JENKINS_HOME /var/jenkins_home

RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo && \
  rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key && \
  yum install -y zip unzip java-1.7.0-openjdk docker jenkins git httpd mercurial && yum clean all 

#Automagically grab the latest versions of the required plugins
RUN  curl -L -o /$JENKINS_HOME/plugins/git.hpi http://updates.jenkins-ci.org/latest/git.hpi
RUN  curl -L -o /$JENKINS_HOME/plugins/git-client.hpi http://updates.jenkins-ci.org/latest/git-client.hpi
RUN  curl -L -o /$JENKINS_HOME/plugins/scm-api.hpi http://updates.jenkins-ci.org/latest/scm-api.hpi
RUN  curl -L -o /$JENKINS_HOME/plugins/ssh-credentials.hpi http://updates.jenkins-ci.org/latest/ssh-credentials.hpi
RUN  curl -L -o /$JENKINS_HOME/plugins/ssh-agent.hpi http://updates.jenkins-ci.org/latest/ssh-agent.hpi
RUN  curl -L -o /$JENKINS_HOME/plugins/credentials.hpi http://updates.jenkins-ci.org/latest/credentials.hpi
RUN  curl -L -o /$JENKINS_HOME/plugins/backup.hpi http://updates.jenkins-ci.org/latest/backup.hpi
RUN  curl -L -o /$JENKINS_HOME/plugins/golang.hpi http://updates.jenkins-ci.org/latest/golang.hpi
RUN  curl -L -o /$JENKINS_HOME/plugins/credentials.hpi http://updates.jenkins-ci.org/latest/credentials.hpi
RUN  curl -L -o /$JENKINS_HOME/plugins/credentials.hpi http://updates.jenkins-ci.org/latest/credentials.hpi

RUN ls /$JENKINS_HOME/plugins/*.hpi 

#Obtain the SOE-CI Jenkins config.xml from Github project repo
RUN mkdir -p /$JENKINS_HOME/jobs/docwheel/ && curl -Lk -o /$JENKINS_HOME/jobs/docwheel/config.xml https://raw.githubusercontent.com/nunnchops/DOCWHEEL-CI/master/jenkins/config.xml 

RUN  usermod -m -d "$JENKINS_HOME" jenkins && \
  chown -R jenkins "$JENKINS_HOME"

#thanks to Laurent Domb for following steps from his installer branch

#This is better and more dynamically handled as a Jenkins user credential using the ssh-credentials plugin above
##su - jenkins -s /bin/bash -c ssh-keygen 

COPY jenkins.sh /usr/local/bin/jenkins.sh

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

USER jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-apache.sh"]
