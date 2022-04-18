FROM nvcr.io/nvidia/tensorflow:22.03-tf2-py3

RUN apt-get update --fix-missing
RUN apt install htop

ENV JUPYTER_TOKEN="niral"
ENV PASSWORD=niral

ARG USER=docker
ARG UID=1000
ARG GID=1000

RUN useradd --system --create-home --home-dir /home/${USER} \
    --shell /bin/bash --gid root -G sudo --uid ${UID} ${USER}
RUN echo ${USER}:docker | chpasswd
USER ${USER}
WORKDIR /home/${USER}
ENV PATH="${PATH}:/home/${USER}/.local/bin"


# Repo requirements
RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade "jax[cuda]==0.2.18"  jaxlib==0.1.69+cuda111 -f https://storage.googleapis.com/jax-releases/jax_releases.html  # Note: wheels only available on linux.
COPY repo_requirements.txt requirements.txt
RUN python -m pip install --user -r requirements.txt
RUN python -m pip cache purge

# RUN apt install -y htop nodejs

#TODO: Maybe add zsh ricing
