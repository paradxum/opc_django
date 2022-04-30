FROM docker:20.10.7-dind

RUN apk add --update --no-cache curl ca-certificates docker-compose imagemagick runit shadow git && \
    curl -L https://get.helm.sh/helm-v3.5.2-linux-amd64.tar.gz |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    rm -f /var/cache/apk/*

RUN mkdir /dest /script
COPY image/. /script/
ENTRYPOINT ["/script/entrypoint"]
