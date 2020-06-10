FROM ubuntu
LABEL maintainer = "demartinvinicius@gmail.com"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install apt-utils apache2 php php-mysqli php-intl php-curl php-zip unzip php-xml php-gd php-mbstring php-xmlrpc php-soap -y
COPY ./apachestuff/ /etc/apache2/sites-available

ADD ./moodle-latest-38.tgz /var/www
COPY ./certs/ /usr/certificado/

RUN a2enmod ssl & a2enmod rewrite & a2ensite 001-pyapp.conf & a2ensite 001-pyapp-le-ssl.conf
EXPOSE 443
ENTRYPOINT [ "apache2ctl" ]
CMD ["-DFOREGROUND"]