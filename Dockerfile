FROM clearlinux:latest AS builder

ARG swupd_args

# Move to latest Clear Linux release
RUN swupd update --no-boot-update $swupd_args

# Install clean os-core bundle in target directory
# using the new os version
RUN source /usr/lib/os-release \
    && mkdir /install_root \
    && swupd os-install -V 13590 \
    --path /install_root --statedir /swupd-state \
    --bundles=os-core,os-core-update --no-boot-update -x

FROM scratch
COPY --from=builder /install_root /

#RUN swupd bundle-add --skip-diskspace-check $(swupd bundle-list -a --quiet)
RUN swupd bundle-add $(swupd bundle-list -a)

CMD ["/bin/bash"]
