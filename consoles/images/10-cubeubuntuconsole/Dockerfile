FROM rancher/os-ubuntuconsole-base
# FROM amd64=ubuntu:xenial arm64=arm64v8/ubuntu:xenial

RUN apt-get update \
    && apt-get install -y --no-install-recommends iptables openssh-server rsync locales \
                           sudo vim less curl ca-certificates psmisc htop kmod iproute2 \
                           net-tools open-iscsi \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/ssh/*key*

RUN locale-gen en_US.UTF-8 \
    && addgroup --gid 1100 rancher \
    && addgroup --gid 1101 docker \
    && useradd -u 1100 -g rancher -G docker,sudo -m -s /bin/bash rancher \
    && useradd -u 1101 -g docker -G docker,sudo -m -s /bin/bash docker \
    && echo ClientAliveInterval 180 >> /etc/ssh/sshd_config \
    && echo '## allow password less for rancher user' >> /etc/sudoers \
    && echo 'rancher ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && echo '## allow password less for docker user' >> /etc/sudoers \
    && echo 'docker ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN curl -o /usr/bin/cube -sSL https://github.com/cnrancher/cube-cli/releases/download/v0.1.0/cube \
    && chmod +x /usr/bin/cube

COPY rc.local /etc/rc.local

ENTRYPOINT ["/usr/bin/ros", "entrypoint"]
