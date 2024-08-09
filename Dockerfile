FROM python:bookworm

LABEL maintainer="lotusnoir"
ARG container=docker

RUN /usr/local/bin/python -m pip install --upgrade pip \
    && pip install --no-cache-dir ansible ansible-lint hvac jmespath \
    && apt-get update -y && apt-get install --no-install-recommends openssh-client git python3-requests python3-proxmoxer sshpass -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && ansible-galaxy collection install community.general community.crypto community.docker community.grafana community.libvirt community.mysql community.windows freeipa.ansible_freeipa fortinet.fortimanager gluster.gluster netbox.netbox 

CMD [""]
