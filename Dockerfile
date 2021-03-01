FROM clearlinux

RUN swupd bundle-add $(swupd bundle-list --all) --skip-diskspace-check

ENTRYPOINT ["zsh"]
