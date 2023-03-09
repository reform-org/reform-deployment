FROM debian:11
RUN apt-get update && apt-get install -y \
    systemd nginx git sudo curl tmux nano default-jre \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | -E bash - && apt-get install -y nodejs
RUN systemctl enable nginx
RUN useradd --create-home --shell /bin/bash -G sudo reform
RUN echo "reform" | passwd reform --stdin
USER reform
RUN curl -fLo coursier https://github.com/coursier/launchers/raw/master/coursier && chmod +x coursier && ./coursier setup
CMD [ "/lib/systemd/systemd" ]
USER reform