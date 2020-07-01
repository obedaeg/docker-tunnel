# Tunnel for Docker 

This tunnel for docker uses autossh to allow you to open a ssh connection and keep it alive. Uses the following parameters:

| Parameter | Description | Example |
|:---------:|:----------:|:-------:|
| LOCAL_PORT | Local port to bind the tunnel | 3306 (for mysql) |
| FORWARD_HOST | The host you want to forward the connection | mydatabase.domain.com |
| FORWARD_PORT | The port in the server you need to forward the traffic | 3306 (for mysql) |
| KEYFILE | The path of the keyfile, you can mount a volume for your keyfile and you need to tell it the path in the container | mykey.pem |
| TUNNEL_USER | the user for your tunnel connection | user |
| TUNNEL_HOST | the host of your tunnel connection | tunnel.domain.com |

This initial release supports only keyfile authentication, and expects the keyfile.

To build the container just run the following command

`docker build -t tunnel-docker .`

Then we run the container

`docker run -it --volume={path_to_your_keyfile}:{keyfile} -e "LOCAL_PORT={PORT}" -e "FORWARD_HOST={FHOST}" -e "FORWARD_PORT={FPORT}" -e "KEYFILE={KEYFILE}" -e "TUNNEL_USER={USER}" -e "TUNNEL_HOST={HOST}" -p {PORT}:{PORT} --rm tunnel-docker`