**this requires podman (rootless preferred)**

TODO user in docker
TODO mount repos using volume

```bash
sudo systemctl enable --now podman.socket
sudo curl -H "Content-Type: application/json" --unix-socket /var/run/docker.sock http://localhost/_ping

systemctl enable --user --now podman.service

podman build -t systemd .
podman run -ti systemd

export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
export DOCKER_BUILDKIT=0

git clone https://github.com/reform-org/reform/
git clone https://github.com/reform-org/reform_discovery/

docker-compose up --build

docker-compose exec --user reform reform /bin/bash

cd reform
npm ci
sbt
fastLinkJS
webappJVM/run
cd ..

cd reform_discovery
cp .env.demo .env
nano .env
npm run start


```