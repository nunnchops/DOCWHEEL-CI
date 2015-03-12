DOCWHEEL-CI
===========

This is a simple linux/Jenkins based orchestration tool for a DevOps influenced solution
for Continuous Improvement of collaborative Google Docs Projects.
This repo includes: Jenkins DocWheel job config.xml, 
script, Jenkins Docker image and libre office HowTo. 

The Following Components are required and used: 

 * Google [Go Lang drive script] (https://github.com/odeke-em/drive)
 * [Gerrit] (http://gerrithub.io/) for collaborative change approval
 * [Github] (https://github.com/) for source version control (https://github.com/)
 * Docwheel3 script located in this repository in the /scripts/ directory (the CI automation base) 
 * A Linux System or Docker image with crontab

Additional Technology that could be added: 
 * A Linux distribution/Docker with crontab or [Jenkins] (http://jenkins-ci.org/) COMPLETED AND IN THIS REPO: see Docker dir
 * [Google drive oauth] (https://wiki.jenkins-ci.org/display/JENKINS/Google+OAuth+Plugin) and [Jenkins Google APIs Client library] (https://wiki.jenkins-ci.org/display/JENKINS/Google+APIs+Client+Library) based java plugin for Jenkins TODO if anyone wants to volunteer?
 * Possible architecture: A [Jenkins Docker image running on Openshift v3] (https://github.com/openshift/jenkins-1-centos) Dockerfile now 
   present in this repo.  
 
See docs dir for documentation, explanation 
and use cases

TODO:
=====
 
 * Configure docwheel for multi project document tracking on a single google doc account 
   e.g. One google doc account may contain multiple project documentation directories
   (may be best to use the more granular implementation of the drive google Go Lang script. 
   [Located here] (https://github.com/prasmussen/gdrive/blob/master/README.md)


