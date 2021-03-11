FROM gongzt/openeuler-21.03

MAINTAINER caozhi1214@gmail.com

WORKDIR /pkgmanage

COPY openEuler.repo /etc/yum.repos.d/
COPY conf.yaml ./

COPY pkgship-*.rpm ./

RUN dnf update -y
RUN dnf install pkgship-*.rpm -y
RUN dnf clean all

sh /etc/pkgship/auto_install_pkgship_requires.sh redis
sh /etc/pkgship/auto_install_pkgship_requires.sh elasticsearch

#CMD ["pkgshipd","start"]
#CMD ["/usr/bin/redis-server"]
