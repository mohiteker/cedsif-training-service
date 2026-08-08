## maintained by shifu@mohitek.net
FROM training/base24xxmohitek.co.mz-image:v2024.12.01 AS base-builder
  #COPY sh/check-logs.sh /usr/local/bin/check-logs
  #RUN apt-get update
  RUN service ssh start

 RUN ls -l /usr/local/bin

 # install SAST(SARIF|SpotBugs|PMD) / DAST(noir) Tools - Static Analyses Security Tools 
  
FROM base-builder AS esistafe-runtime

 #-Identification-#  
 ARG oe_uuid
 ARG oe_f_prefix
 ARG OE_CLI_SH
 
 # important file
 COPY sh/oe-environment-usermap.sh       $OE_CLI_SH/oe-usermap.sh
 COPY sh/oe-logger-init.sh               $OE_CLI_SH/oe-logger-init.sh   
 COPY sh/oe-logger.sh                    $OE_CLI_SH/oe-logger.sh
 
 #
 RUN ls -l $OE_CLI_SH
 RUN echo  $OE_CLI_SH   "${oe_f_prefix}" ${oe_uuid}
 
 # Creating User and setting Grants 
 RUN bash $OE_CLI_SH/oe-usermap.sh "${oe_f_prefix}" ${oe_uuid}
 ADD tar/training26XXesistafe-cedsif-demo-lab.tar.gz  /srv/
 
 # Principal enviroment file | All compressed file should be executed by this commander
 COPY sh/check-logs.sh /usr/local/bin/check-syslog
 RUN chown demo:${oe_f_prefix} -R /srv && \
	chown demo:${oe_f_prefix} /usr/local/bin/check-syslog
 
 # Hardening by non-root user
 USER demo
 
 RUN  cd ~ && \
	ln -sf /srv/training26XXesistafe-cedsif-demo-lab  training26XXesistafe-cedsif-demo-lab
 #
 WORKDIR /home/demo
 
 ENTRYPOINT ["/usr/local/bin/check-syslog"]

#FROM ubuntu:20.04 AS appsecurity-optimize
