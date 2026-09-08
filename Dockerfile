FROM quay.io/fedora/fedora-minimal:latest@sha256:5fc07f0a3cdf3d73922239d3822cf8b6e857b719e57e833ee87d8c8fe7c0fa73
#
# empty space for easier rebasing
#
LABEL org.opencontainers.image.source="https://github.com/mscherer/woodpecker-check-rust"

RUN dnf install --nodocs --setopt=install_weak_deps=False -y cargo rust clippy rustfmt cargo-cyclonedx && dnf clean all && rm -Rf /var/log/dnf5.log /var/lib/dnf/ /var/cache/

COPY build.sh /usr/local/bin/build.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/build.sh"]
