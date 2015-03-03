 Jenkins config.xml for orchestrating Docwheel CI 
=================================================

There are a few pre-requisites: 

Jenkins needs the following plugins: 

 * mercurial (if you want to build Go drive from code on the fly)** 
 * Go lang (for drive cli command)
 * Git client (for repo management)
 * multiple scm (for mulit workspace sub directories)
 * ssh agent (for push back to Gerrit origin/master)

**There is no really easy way to get mercurial support in the docker jenkins linux image
so there is a simple curl command to grab a pre-compiled drive binary from a web server. 

NOTE ON SECURITY: 
The Go drive credentials.json is also pulled using curl over http, this is fine for a 
really private environment, but PLEASE NOTE THIS IS INSECURE over the internet.. use 
SCP please. 

TODO: pull drive artefacts using SCP. 

