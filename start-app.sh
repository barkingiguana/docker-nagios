#! /bin/sh

/etc/init.d/apache2 restart
exec /usr/sbin/nagios3 /etc/nagios3/nagios.cfg
