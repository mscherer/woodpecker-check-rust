FROM quay.io/fedora/fedora-minimal:latest@sha256:09ccb042101b6e6077e24a9eab51b73f4d98c9c99f3e13c47c5c7d3f48f25fb7
#
# empty space for easier rebasing
#
LABEL org.opencontainers.image.source="https://github.com/mscherer/woodpecker-check-rust"

RUN dnf install --nodocs --setopt=install_weak_deps=False -y cargo rust clippy rustfmt cargo-cyclonedx && dnf clean all && rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/

COPY build.sh /usr/local/bin/build.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/build.sh"]
