FROM debian:11-slim

RUN apt update && \
    apt install -y --no-install-recommends python3 xz-utils ca-certificates wget zsh gcc clangd clang lld flex bison libncurses5-dev make git exuberant-ctags sparse bc libssl-dev libelf-dev && \
    rm -rf /var/lib/apt/lists/*
RUN chsh -s /bin/zsh && \
    mkdir /home/linux

VOLUME [ "/home/workspace" ]

WORKDIR /home/workspace

RUN git config --global http.sslVerify false && \
    git clone -b v5.15 --depth 1 https://github.com/torvalds/linux.git

COPY kernelconfig linux/.config
COPY compile_commands.json /home/workspace/linux

ENTRYPOINT [ "/bin/zsh" ]