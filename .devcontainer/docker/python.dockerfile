FROM  python:3.12.0-slim-bullseye

ARG USERNAME
ARG USER_PASSWORD
ARG UID
ARG GID

RUN apt-get update && \ 
    apt-get install -y curl postgresql-client iproute2 libpq-dev build-essential

RUN groupadd -g $GID $USERNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$USER_PASSWORD | chpasswd && \ 
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# USER USERNAME