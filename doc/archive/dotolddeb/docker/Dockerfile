FROM debian:stretch
MAINTAINER Jason Longshore <longshorej@gmail.com>

ENV JSL_DOCKER_FORCE_REBUILD=20170628.01
RUN apt-get update && apt-get install -y apt-transport-https openssh-server sudo vim
RUN mkdir /var/run/sshd

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
