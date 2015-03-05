DOCWHEEL-CI
===========

This is a simple linux based script and HowTo for a DevOps influenced solution 
for Continuous Improvement of collaborative 
Google Docs projects.

The Following Components are required and used: 

 * Google [Go Lang drive script] (https://github.com/odeke-em/drive)
 * [Gerrit] for collaborative change approval (http://gerrithub.io/)
 * [Github] for source version control (https://github.com/)
 * Docwheel3 script located in this repository in the /scripts/ directory (the CI automation base) 
 * A Linux System or Docker image with crontab

Additional Technology that could be added: 
 * A Linux distribution/Docker with crontab or [Jenkins] (http://jenkins-ci.org/) 
 * [Google drive oauth plugin for Jenkins] (https://wiki.jenkins-ci.org/display/JENKINS/Google+OAuth+Plugin)
 * Possible architecture: A [Jenkins Docker image running on Openshift v3] (https://github.com/openshift/jenkins-1-centos) 
 
See docs dir for documentation, explanation 
and use cases

TODO:
=====
 
 * Configure docwheel for multi project document tracking on a single google doc account 
   e.g. One google doc account may contain multiple project documentation directories
   (may be best to use the more granular implementation of the drive google Go Lang script. 
   [Located here] (https://github.com/prasmussen/gdrive/blob/master/README.md)


