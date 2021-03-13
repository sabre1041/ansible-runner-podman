FROM registry.redhat.io/ubi8/ubi:latest

RUN yum install -y python3-pip podman && \
    yum clean all && \
    pip3 install ansible-builder && \
    cp /etc/containers/storage.conf /etc/containers/storage.conf.orig && \
    sed -i 's/driver = "overlay"/driver = "vfs"/' /etc/containers/storage.conf && \
    cp /usr/share/containers/containers.conf /etc/containers/ && \
    sed -i 's/# cgroup_manager = "systemd"/cgroup_manager = "cgroupfs"/' /etc/containers/containers.conf
