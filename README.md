# Docker OpenConnect VPN Gateway

OpenConnect running in a docker container.

Some 2FA support is possible by attaching to the container to manually answer the challenge.

## Setup

Create a `.env` file and set the environment variables as in `.env.example`:
```
SERVER=vpn.example.com
USERNAME=username@example.com
PASSWORD=password

KEEPALIVE_URL=http://example.com/
KEEPALIVE_INTERVAL=300
```

## Run

Start container and attach to it so you can enter the `PASSCODE`
```
docker network create openconnect-vpn
docker-compose up -d
docker attach --detach-keys ctrl-a openconnect-vpn
```

Enter 2FA `PASSCODE` (will not be visible) and press `enter`

Press `ctrl-a` to detach without stopping the container

Get container address
```
export OPENCONNECT_GATEWAY_ADDRESS=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' openconnect-vpn)
```

Route specific addresses / classes through the VPN
```
ip route add x.x.x.x/x via "$OPENCONNECT_GATEWAY_ADDRESS"
```
