FROM debian:11
RUN apt-get update && apt-get install -y \
    systemd  \
    && rm -rf /var/lib/apt/lists/*