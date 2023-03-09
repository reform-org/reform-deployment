**this requires podman (rootless preferred)**

```bash
sudo systemctl enable --now podman.socket
sudo curl -H "Content-Type: application/json" --unix-socket /var/run/docker.sock http://localhost/_ping

systemctl enable --user --now podman.service

podman build -t systemd .
podman run -ti systemd

export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
export DOCKER_BUILDKIT=0

docker-compose up --build
docker-compose exec -i reform /bin/bash
systemctl start nginx


```