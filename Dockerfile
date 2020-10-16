FROM opensourceway/openeuler:20.09beta

WORKDIR /pkgmanage



COPY openEuler.repo /etc/yum.repos.d/
COPY conf.yaml ./

COPY pkgship-*.rpm ./

RUN dnf update -y
RUN dnf install  pkgship-*.rpm -y
RUN dnf install  redis -y
COPY redis.conf  /etc/
RUN dnf clean all

#CMD ["pkgshipd","start"]
#CMD ["/usr/bin/redis-server"]
