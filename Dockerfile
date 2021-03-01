FROM clearlinux

RUN swupd bundle-add $(swupd bundle-list --all)

ENTRYPOINT ["bash"]
