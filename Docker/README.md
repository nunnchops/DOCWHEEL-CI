Jenkins DocWheel-CI Docker Image
================================

This is a Jenkins, DocWheel-CI Docker image intended for use with [OpenShift v3](https://github.com/openshift/origin)

For an example of how to use it, [see this sample.](https://github.com/openshift/origin/blob/master/examples/jenkins/README.md)

The image is not yet pushed to Dockerhub. 

With docker installed on a suitable system it is possible to build this image from the Dockerfile. 

from the relative directory run: 

$ docker build -t "docwheel-jenkins" .

The container will be available, check with: 

$ docker ps -a

Then just run with: 

docker run <container_id>


Additional Notes
================

Currently the Jenkins DocWheel project loaded using the config.xml from the 
Github master source expects the Go Lang Google Drive utility to be present on 
the Jenkins host. however this Jenkins Docker image has Go Lang built in so could 
compile the Drive code from github. (ToDo for Jenkins Project config)

 


