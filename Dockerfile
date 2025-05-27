FROM debian:bookworm-slim

# Install requirements
RUN apt update && \
    apt install -y git gitpkg sbuild devscripts debhelper eatmydata ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Create a Chroot environment for sbuild
RUN sbuild-createchroot --include=eatmydata,ca-certificates bookworm /srv/chroot/bookworm-amd64 http://deb.debian.org/debian

# Docker based settings
RUN git config --global --add safe.directory /workspace/learning-debian-packaging

# Set workdir

WORKDIR /workspace

# DEB build process
#RUN gitpkg 1.0

# standard command: Start a Bash-Shell
CMD ["/bin/bash"]
