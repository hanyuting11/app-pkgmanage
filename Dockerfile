FROM opensourceway/openeuler:20.09beta

WORKDIR /pkgmanage

COPY openEuler.repo /etc/yum.repos.d/
COPY conf.yaml ./
COPY redis.conf  /etc/
COPY pkgship-*.rpm ./

RUN dnf update -y
RUN dnf install -y pkgship-*.rpm redis 
RUN dnf clean all
RUN redis-server /etc/redis.conf

#COPY conf.yaml /etc/pkgship
#RUN pkgshipd start
#CMD ["pkgshipd", "start"] 

