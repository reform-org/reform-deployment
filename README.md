This should be done on a native debian host and is just done this way to allow testing this setup.

**this requires podman (rootless preferred)**

TODO user in docker

```bash
systemctl enable --user --now podman.service

export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"

git clone https://github.com/reform-org/reform/
git clone https://github.com/reform-org/reform_discovery/

docker-compose up --build

docker-compose exec --user reform reform /bin/bash

sudo chown -R reform reform
sudo chown -R reform reform_discovery

cd reform
npm ci
. ~/.profile
sbt fastLinkJS
npm run build
export $(cat .env | xargs)
sbt webappJVM/run
cd ..

cd reform_discovery
npm ci
cp .env.demo .env
nano .env
npm run start
cd ..


turnserver --static-auth-secret=${TURN_SECRET}
# tls certs turn_server_cert.pem turn_server_pkey.pem
# pid file /var/tmp/turnserver.pid
# sqlite path /var/lib/turn/turndb

```
