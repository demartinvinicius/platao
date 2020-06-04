FROM ubuntu
LABEL maintainer = "demartinvinicius@gmail.com"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install apt-utils apache2 php -y

#RUN cd /tmp/mod_wsgi && make
#RUN cd /tmp/mod_wsgi && make install
EXPOSE 80
ENTRYPOINT [ "apache2ctl" ]
CMD ["-DFOREGROUND"]