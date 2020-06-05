FROM ubuntu
LABEL maintainer = "demartinvinicius@gmail.com"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install apt-utils apache2 php php-mysqli php-intl php-curl php-zip unzip php-xml php-gd php-mbstring php-xmlrpc php-soap -y
COPY ./apachestuff/001-pyapp.conf /etc/apache2/sites-available
RUN a2ensite 001-pyapp.conf
#RUN cd /tmp/mod_wsgi && make
#RUN cd /tmp/mod_wsgi && make install
EXPOSE 80
ENTRYPOINT [ "apache2ctl" ]
CMD ["-DFOREGROUND"]