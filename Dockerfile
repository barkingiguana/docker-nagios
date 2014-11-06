FROM barkingiguana/base

MAINTAINER Craig R Webster <craig@barkingiguana.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq apache2 nagios3

RUN usermod -a -G nagios www-data
RUN chmod -R g+x /var/lib/nagios3/
RUN sed -i 's/check_external_commands=0/check_external_commands=1/g' /etc/nagios3/nagios.cfg

RUN /etc/init.d/apache2 start
ENTRYPOINT [" /usr/sbin/nagios3" ]
CMD [ "-d", "/etc/nagios3/nagios.cfg" ]
EXPOSE 80
