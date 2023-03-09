**this requires podman (rootless preferred)**

TODO user in docker

```bash
systemctl enable --user --now podman.service

export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"

git clone https://github.com/reform-org/reform/
git clone https://github.com/reform-org/reform_discovery/

docker-compose up --build

docker-compose exec --user reform reform /bin/bash

cd reform
npm ci
. ~/.profile
sbt fastLinkJS
npm run build
export $(cat .env | xargs)
sbt webappJVM/run
cd ..

cd reform_discovery
cp .env.demo .env
nano .env
npm run start


```
