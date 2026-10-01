FROM quay.io/fedora/fedora-minimal:latest@sha256:dfc527c1c5bedd2c324c52b16835c775e7930815b0490af0dcfac686c6febe1c
#
# empty space for easier rebasing
#
LABEL org.opencontainers.image.source="https://github.com/mscherer/woodpecker-check-rust"

RUN dnf install --nodocs --setopt=install_weak_deps=False -y cargo rust clippy rustfmt cargo-cyclonedx && dnf clean all && rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/

COPY build.sh /usr/local/bin/build.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/build.sh"]
