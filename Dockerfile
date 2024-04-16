FROM jenkins/jenkins:latest
USER root
RUN apt-get update && apt-get install -y python3 python3-pip groff && \
    pip3 install awscli || exit 1
USER jenkins
