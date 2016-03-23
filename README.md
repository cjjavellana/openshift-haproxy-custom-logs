# openshift-haproxy-custom-logs
OpenShift template router with custom logging

Runs a custom HAProxy router image with logging on an OpenShift v3 cluster.
Configuration sends UDP messages to a syslog server for logging frontend
and backend requests received/sent by the HAProxy router.

Setup:
------
First up configure rsyslog to allow UDP syslog reception.

       sudo vi /etc/rsyslog.conf
       # In the editor, add these lines:
       # Provides UDP syslog reception
         $ModLoad imudp
         $UDPServerRun 514
         $UDPServerAddress 127.0.0.1

And add a configuration file to send local1 syslog facility messages to a
custom haproxy log file.

       echo "
         local1.*   /var/log/haproxy.log
         haproxy.*  /var/log/haproxy.log
       " > /etc/syslog.d/haproxy.conf

And restart rsyslogd.

       sudo service rsyslog restart

Build:
------
Build the docker images.

     make


Run:
----
Run the router with the custom built docker image:

     make run

     # Or use:  oadm router --images=ramr/origin-haproxy-router:v1


