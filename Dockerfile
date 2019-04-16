FROM docker:dind

# Install Helm
ENV VERSION=2.12.0
ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
ENV TAR_FILE="helm-v${VERSION}-linux-amd64.tar.gz"
RUN apk add --update --no-cache curl ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    rm -f /var/cache/apk/*

# Install docker compose
RUN apk add --update --no-cache py-pip python-dev libffi-dev openssl-dev gcc libc-dev make python2 && \
	pip install docker-compose && \
	apk del py-pip python-dev libffi-dev openssl-dev gcc libc-dev make && \
	rm -f /var/cache/apk/*
	
# Install our requirements
RUN apk add --update --no-cache curl ca-certificates imagemagick runit shadow git && \
	rm -f /var/cache/apk/*

RUN mkdir /dest /script
COPY image/. /script/
ENTRYPOINT ["/script/entrypoint"]
