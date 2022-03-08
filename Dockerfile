FROM registry.redhat.io/ansible-automation-platform-21/ansible-builder-rhel8:1.0

RUN microdnf install -y  podman && \
    microdnf clean all && \
    cp /etc/containers/storage.conf /etc/containers/storage.conf.orig && \
    sed -i 's/driver = "overlay"/driver = "vfs"/' /etc/containers/storage.conf && \
    cp /usr/share/containers/containers.conf /etc/containers/ && \
    sed -i 's/# cgroup_manager = "systemd"/cgroup_manager = "cgroupfs"/' /etc/containers/containers.conf
