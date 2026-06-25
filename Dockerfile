FROM quay.io/fedora/fedora-minimal:latest@sha256:4696d24cb7e8c2bfd45e371eca09c93bb4500031e93e9d9592c4bada3edd7d09
#
# empty space for easier rebasing
#
LABEL org.opencontainers.image.source="https://github.com/mscherer/woodpecker-check-rust"

RUN dnf install --nodocs --setopt=install_weak_deps=False -y cargo rust clippy rustfmt cargo-cyclonedx && dnf clean all && rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/

COPY build.sh /usr/local/bin/build.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/build.sh"]
