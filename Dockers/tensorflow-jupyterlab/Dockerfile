FROM tensorflow/tensorflow:latest

# Change default shell
RUN chsh -s /bin/bash
ENV SHELL=/bin/bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install usefull tools
RUN apt-get -qy update && apt-get install -qy \
    man \
    vim \
    nano \
    htop \
    curl \
    wget \
    rsync \
    ca-certificates \
    git \
    zip \
    procps \
    ssh \
    gettext-base \
    transmission-cli \
    && apt-get -qq clean \
    && rm -rf /var/lib/apt/lists/*

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION v12.20.1

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/bin
ENV PATH $NODE_PATH:$PATH

# Install Jupyter
RUN pip install pip && \
    pip install jupyterlab ipywidgets && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter nbextension enable --py widgetsnbextension #enable ipywidgets

COPY jupyter.sh /usr/bin/jupyter.sh

# Create a HOME dedicated to the ovhcloud user (42420:42420)
RUN mkdir -p /workspace && chown -R 42420:42420 /workspace
ENV HOME /workspace
WORKDIR /workspace

EXPOSE 8080

ENTRYPOINT []
CMD ["/usr/bin/jupyter.sh"]