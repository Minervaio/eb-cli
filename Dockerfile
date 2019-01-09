FROM alpine:3.8
    RUN apk -v --update add \
        git \
        less \
        openssh-client \
        python3 \
        && \
    pip3 install --upgrade pip && \
    pip3 install --upgrade setuptools awsebcli && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

VOLUME /root/.aws

VOLUME /project

WORKDIR /project

ENTRYPOINT ["eb"]
