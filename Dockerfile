#
# This is the HAProxy router for OpenShift Origin.
#
# The standard name for this image is openshift/origin-haproxy-router
#
FROM docker.io/openshift/origin-haproxy-router:v1.2.0

ADD haproxy-config.template /var/lib/haproxy/conf/haproxy-config.template

WORKDIR /var/lib/haproxy/conf

EXPOSE 80
ENV TEMPLATE_FILE=/var/lib/haproxy/conf/haproxy-config.template \
    RELOAD_SCRIPT=/var/lib/haproxy/reload-haproxy
ENTRYPOINT ["/usr/bin/openshift-router"]
