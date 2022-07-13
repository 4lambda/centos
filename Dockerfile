FROM            centos:8

RUN             rpm --import https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official && \
                rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-8 && \
                dnf -y --disablerepo '*' --enablerepo=extras \
                    swap centos-linux-repos centos-stream-repos && \
                dnf -y distro-sync

RUN             yum makecache -y -q \
                && yum update -y \
                && yum install -y \
                    epel-release \
                && yum upgrade -y \
                && yum clean all

