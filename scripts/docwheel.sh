#!/bin/bash

#28-02-2015
#nunnchops@googlemail.com



#small wrapper script that can be run on a prepared Linux host machine or 
#Openshift Docker instance or Jenkins instance to enable Continuous Improvement
#Of Google Docs documentation for Github based Open Source Software projects.  

#N.B. User required additions to this script are outlined with <SOME_REF> syntax
#Be sure to substitute these with your chosen working dir paths and Gerrit ssh 
#username

#This script requires: 
#Git, Google Go drive script a small Go based script that utilises the 
#google drive api. See related documentation 
#A Github target project repo
#A Gerrit replication repo of the Github project repo (for CI change approval) 
#A Linux host machine to run this script on via crontab or 
#A Red Hat Openshift Online Jenkins instance and Docker based Go enabled image running Go drive api script.  
#
#Some friends or colleagues to approve the document changes :) 

#-Create Github master project
#-Create Gerrit change repo and setup replication on the Github master
#-git clone (the Gerrit based repo)
#-Then drive init a dir for Go drive script
#-drive pull and export to the docs dir of the local git repo
#-git add, git commit (with date and time for Gerrit ref), git push with 
#HEAD:refs/for/master (see Gerrit docs)

#Gerrit replication repo that you push to
GERRITREPO=~/<INSERT_PROJECT_REPO_NAME>

#Googledrive working dir that you pull into 
GOOGLEDRIVELIVE=~/googledrive_live

#dir to export googledocs to in the gerrit repo
#nicer to do this as it would be possible to init a protected
#folder in the users home dir keeping the .gd drive configs and 
#googledocs creds away from the gerrit repo and ultimately the github repo
#if this is also a sub dir of the gerrit repo space we can clobber files in it
#without worrying about clobbering gerrit repo artefacts such as README.md and 
#LICENCE definitions
#of course this could be just a gerrit replicated project repo 
GERRITREPODOCS=$GERRITREPO/docs/

cd $GOOGLEDRIVELIVE

#use the Google Go drive script to pull the working document 
#NB if you are running in cron you will have to use absolute paths to bin
#or declare a PATH variable
#We always grab the txt export of the googledoc as this enables the changes
#to be readable in the Gerrit change approval url
/usr/bin/drive pull --no-clobber=false --no-prompt=true --export="txt,odt" --export-dir=$GERRITREPODOCS

#Git push to gerritrepo for approval process. 
cd $GERRITREPO
/usr/bin/git add . 
/usr/bin/git commit -m "`date +%F-%H-%M`"
/usr/bin/git push ssh://<SOMEUSER>@review.gerrithub.io:29418/<PROJECT_PATH> HEAD:refs/for/master

