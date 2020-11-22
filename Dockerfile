FROM fedora:32
RUN dnf -y install util-linux-user vim finger passwd 
RUN mkdir /opt/docker
COPY * /opt/docker
WORKDIR /opt/docker
CMD [ "/bin/bash", "opt/docker/install.sh" ]

