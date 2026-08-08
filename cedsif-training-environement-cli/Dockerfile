#create by shifu@mohitek.net
#This image is to intend to create a docker os system deployed as a service (OSaaS) over a node cluster. using ubuntu image

#Docker allows only one app per isolated process as a Deamon.
FROM training/base24xxmohitek.co.mz-image:v2024.01.01 AS portal-builder

RUN apt-get  update
RUN apt-get install lsof -y

#ADD  tar/lsof-4.99.0.tar		/tmp/
COPY sh/_lsof-install2image.sh	"/usr/local/sbin/lsof-install"
COPY sh/_apache-install2image.sh "/usr/local/sbin/apache-install"

# tools
RUN ls -shl /tmp/
RUN ls -shl /srv/

COPY sh/_rvm-install2image.sh	"/usr/local/sbin/rvm-install"
RUN  bash rvm-install
 
# add and extract files
COPY tar/mohitek25XXsample-platform-portal.tar.gz		/srv/
RUN  ls -l "/srv"

#
COPY sh/_ruby-install2image.sh	"/usr/local/sbin/ruby-install"
COPY sh/oe-trainee-config.sh    "/usr/local/sbin/oe-trainee-config.sh"

# preparing dependency installation 
RUN bash rvm-install && \
bash ruby-install 

    #just copy
    COPY sh/_install-portal.sh          "/usr/local/sbin/portal-install"
    
    # add users to image
    ARG oe_prefix=${oe_prefix}
    ARG oe_f_prefix=${oe_prefix}
    ARG OE_CLI_SH=${oe_cli_sh}
    ARG oe_uuid=${uuid}

    #
    #RUN 
    RUN echo "OE_PREFIX_IS="$oe_prefix
	# important file
	COPY sh/oe-environment-usermap.sh	"$OE_CLI_SH/oe-usermap.sh"
	COPY sh/oe-logger-init.sh		"$OE_CLI_SH/oe-logger-init.sh"
	COPY sh/oe-logger.sh			"$OE_CLI_SH/oe-logger.sh"
	
    RUN bash oe-usermap.sh "${oe_f_prefix}" ${oe_uuid}
    RUN apt-get update && apt-get install jq -y
    RUN chown demo:${oe_f_prefix} -R /srv
    RUN ls -shl /srv/
    
    #starting isolated app-service.
    RUN service ssh start
    EXPOSE 22
   
#CMD ["/usr/sbin/sleep 5s","exit;"]
ENTRYPOINT ["/usr/local/sbin/portal-install","-D"]
