# Builder
FROM training/oe-portal25xxmohitek.co.mz-image:v2025.01.01 as Portal
 RUN apt-get update
 RUN service ssh start
 # generationg hotkeys to be recognized as a server on handshake
 RUN ssh-keygen -A

 # install SBom(Syft) tools
 RUN curl -sSfL https://get.anchore.io/syft | sudo sh -s -- -b /usr/local/bin
 
 # install Sca (Grype|Trivy) using System analyses to analise Sbom
 RUN curl -sSfL https://get.anchore.io/grype | sudo sh -s -- -b /usr/local/bin

 # install Sca (Trivy) using System analyses to analise more items
 RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo sh -s -- -b /usr/local/bin v0.70.0

 # install SAST(SpotBugs|Pmd) / DAST(noir) Tools - Static Analyses Security Tools
 
 USER demo

 EXPOSE 22
 CMD ["/usr/sbin/sshd","-D"]
