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

docker-compose exec reform /bin/bash
apt update && apt install -y nginx git sudo curl
systemctl start nginx
useradd --create-home -G sudo reform
passwd reform
exit

docker-compose exec --user reform reform /bin/bash
cd ~
git clone https://github.com/reform-org/reform/
git clone https://github.com/reform-org/reform_discovery/
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
. .profile
nvm install --lts


```