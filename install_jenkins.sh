#!/bin/bash
#Step 1: Install Java
 sudo apt update
 sudo apt install openjdk-8-jdk

#Step 2: Add Jenkins Repository
 wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add –

#Step 3: Add Jenkins repo to the system
 sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

#Step 4: Install Jenkins
 sudo apt update
 sudo apt install Jenkins

#Step 5: Verify installation
 systemctl status Jenkins

#Step 6: Once Jenkins is up and running, access it from the link:
echo "http://localhost:8080"
