FROM tutum/apache-php:latest
ENV DEBIAN_FRONTEND noninteractive

RUN rm -fr /app && git clone https://github.com/munkireport/munkireport-php.git /app
RUN apt-get install -y php5-sqlite
ADD config.php /app/
ADD run.sh /
RUN chmod +x /run.sh

EXPOSE 80
CMD ["/run.sh"]
