#!/bin/sh
# by shifu

cd /tmp/
	sudo unzip sonarqube-25.3.0.104237.zip -d /opt
	sudo mv /opt/sonarqube-25.3.0.104237 /opt/sonarqube
	sudo groupadd sonar
	#sudo useradd -c "user to run SonarQube" -d /opt/sonarqube -g trainee sonar
	sudo chown demo:sonar /opt/sonarqube -R

# add properties
cat <<EOF >> /opt/sonarqube/conf/sonar.properties
sonar.jdbc.username=demo
sonar.jdbc.password=demo
sonar.jdbc.url=jdbc:postgresql://0.0.0.0:5432/sonarqube
EOF

#test connection
#curl -I http://0.0.0.0:9000
