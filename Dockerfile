FROM docker:dind

# Install Helm
ENV VERSION=3.5.2
ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v${VERSION}-linux-amd64.tar.gz"
RUN apk add --update --no-cache curl ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    rm -f /var/cache/apk/*

# Install docker compose
RUN apk add --update --no-cache py-pip python3-dev libffi-dev openssl-dev gcc libc-dev make python3 rust cargo && \
	pip3 install docker-compose requests && \
	apk del python3-dev libffi-dev openssl-dev gcc libc-dev make rust cargo && \
	rm -f /var/cache/apk/*
	
# Install our requirements
RUN apk add --update --no-cache curl ca-certificates imagemagick runit shadow git && \
	rm -f /var/cache/apk/*

RUN mkdir /dest /script
COPY image/. /script/
ENTRYPOINT ["/script/entrypoint"]
