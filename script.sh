#!/bin/bash
apt update
apt install openjdk-11-jdk -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update
apt install jenkins -y
service jenkins start
password=$(head -n 1 /var/lib/jenkins/secrets/initialAdminPassword) 
echo Le mot de passe admin temporaire est : $password

################################
#Pour les futurs étapes#

#wget http://localhost:8080/jnlpJars/jenkins-cli.jar
#java -jar jenkins-cli.jar java -jar jenkins-cli.jar -s http://127.0.0.1:8080 -auth admin:$password install-plugin configuration-as-code

################################
