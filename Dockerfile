FROM centos:6.6
MAINTAINER David Aspinall <David.Aspinall@ed.ac.uk>
# centos 6.7/7 fails perl dependencies (Time::Timezone, Time::JulianDay)

COPY *.rpm /tmp/
RUN yum -y install /tmp/t1utils*.rpm ghostscript man /tmp/claimform-2.5.9-1.noarch.rpm \
 && yum clean all

RUN mkdir /claims
COPY claimformrc /claims

WORKDIR /tmp
RUN rpm2cpio claimform-2.5.9-1.noarch.rpm | cpio -id \
 && cp -p usr/share/man/man1/claimform.1.gz /usr/share/man/man1/ \
 && cp -p usr/share/doc/claimform-2.5.9/example /claims/example.claim \
 && rm -rf /tmp/*

ENV CLAIMFORMRC=/claims/claimformrc

VOLUME ["/claims"]
WORKDIR /claims

CMD ["/usr/bin/claimform"]
