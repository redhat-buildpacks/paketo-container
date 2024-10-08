# FROM registry.access.redhat.com/ubi9/ubi:latest@sha256:9e6a89ab2a9224712391c77fab2ab01009e387aff42854826427aaf18b98b1ff as builder
FROM fedora as builder
RUN dnf -y install golang

WORKDIR /go/src/buildpacks/pack

COPY pack/ .

RUN CGO_ENABLED=0 GOTOOLCHAIN=go1.22.0 go build -ldflags "-s -w" -a ./cmd/pack

# Rebase on ubi9
FROM registry.access.redhat.com/ubi9:latest@sha256:9e6a89ab2a9224712391c77fab2ab01009e387aff42854826427aaf18b98b1ff
RUN dnf -y install gettext

COPY --from=builder /go/src/buildpacks/pack/pack /usr/bin/pack

WORKDIR /workdir

RUN \
  groupadd -g 1000 pack; \
  useradd -u 1000 -g pack -s /bin/sh -d /home/pack pack

RUN chown -R pack:pack /workdir

USER pack

ENTRYPOINT ["/usr/bin/pack"]