FROM alpine:3.8
    RUN apk -v --update add \
        git \
        less \
        openssh-client \
        py-pip \
        python \
        && \
    pip install --upgrade pip && \
    pip install --upgrade awsebcli && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

VOLUME /root/.aws

VOLUME /project

WORKDIR /project

ENTRYPOINT ["eb"]
