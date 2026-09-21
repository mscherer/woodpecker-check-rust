FROM quay.io/fedora/fedora-minimal:latest@sha256:39102c778ef644cd79b8762bdc187e6c1ccb192ffb7f09fffc83fd773c6d77bf
#
# empty space for easier rebasing
#
LABEL org.opencontainers.image.source="https://github.com/mscherer/woodpecker-check-rust"

RUN dnf install --nodocs --setopt=install_weak_deps=False -y cargo rust clippy rustfmt cargo-cyclonedx && dnf clean all && rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/

COPY build.sh /usr/local/bin/build.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/build.sh"]
