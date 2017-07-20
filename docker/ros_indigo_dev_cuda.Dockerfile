FROM malichao/ros_indigo_dev_cuda_base

MAINTAINER Malcolm Ma <malichaooo@gmail.com>

# Arguments
ARG user
ARG uid
ARG gid
ARG home
ARG shell

ENV DEBIAN_FRONTEND=noninteractive

# Copy Qt creator settings to avoid crash due to loading Welcome window
COPY QtProject /home/${user}/.config/QtProject
RUN chown ${uid}:${gid} -R /home/${user}/.config

RUN mkdir -p /home/${user} && \
    echo "${user}:x:${uid}:${gid}:${user},,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    echo "${user} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${user} && \
    chmod 0440 /etc/sudoers.d/${user} && \
    chown ${uid}:${gid} -R /home/${user}

USER ${user}
ENV HOME /home/${user}
