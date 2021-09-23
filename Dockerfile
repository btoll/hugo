FROM alpine:3.13.1@sha256:3747d4eb5e7f0825d54c8e80452f1e245e24bd715972c919d189a62da97af2ae

LABEL description="Docker container for building and serving static sites with Hugo <https://gohugo.io/>."
LABEL maintainer="Benjamin Toll <benjam72@yahoo.com>"

ARG VERSION=0.80.0
RUN wget -O - "https://github.com/gohugoio/hugo/releases/download/v$VERSION/hugo_${VERSION}_Linux-64bit.tar.gz" | tar -xz -C /tmp \
    && mkdir -p /usr/local/bin \
    && mv /tmp/hugo /usr/local/bin/hugo

ENV THEME hugo-lithium-theme
RUN apk update \
    && apk add git \
    && mkdir /themes \
    && git clone https://github.com/niklasbuschmann/contrast-hugo.git /themes/contrast-hugo \
    && git clone https://github.com/jrutheiser/hugo-lithium-theme.git /themes/hugo-lithium-theme

COPY hugo.sh ./
WORKDIR /src

EXPOSE 1313

USER 1000

ENTRYPOINT ["/hugo.sh"]

