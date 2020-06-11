FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install apt-utils apache2 php php-mysqli php-intl php-curl php-zip unzip php-xml php-gd php-mbstring php-xmlrpc php-soap -y
COPY ./apachestuff/ /etc/apache2/sites-available

ADD ./moodle-latest-38.tgz /var/www
COPY ./certs/ /usr/certificado/

RUN a2enmod ssl
RUN a2enmod rewrite 
RUN a2ensite 001-pyapp.conf 
RUN a2ensite 001-pyapp-le-ssl.conf
COPY ./startup.sh /scripts/startup.sh


RUN ["mv","/teste/config.php","/var/www/moodle/config.php"]
RUN ["chmod","+x","/scripts/startup.sh"]
ENTRYPOINT [ "/scripts/startup.sh" ]
EXPOSE 80 443