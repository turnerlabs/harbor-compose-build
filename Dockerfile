FROM golang:1.10.3

# install docker
ENV DOCKER_VERSION 18.03.1
RUN apt-get update && apt-get install --no-install-recommends -y \
    apt-transport-https \
    ca-certificates \
    ssh \
    git \
    curl \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && apt-get install --no-install-recommends -y docker-ce=${DOCKER_VERSION}~ce-0~debian && \
    rm -rf /var/lib/apt/lists/*

RUN go get github.com/mitchellh/gox
RUN go get github.com/tcnksm/ghr
RUN go get github.com/inconshreveable/mousetrap
RUN go get github.com/jstemmer/go-junit-report
