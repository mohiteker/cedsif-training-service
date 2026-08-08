#!/bin/bash
# by shifu@mohitek.net

# For dev use install to compile
  mvn install
  source /usr/local/sbin/sdk-install
  
# This will skip all tests from lab0 and  failed compiler
  cd training26XXesistafe-cedsif-portal-lab/
	mvn install -DskipTests
	#
	cd trainee26XXdemo-esistafe-daaid-portal-lab1
	  mvn tomcat7:run
