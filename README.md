# FHNW-Sync
A docker container that automatically connects to a vpn client, mounts a given file share and copies the specified folders to the filesystem. This is done every day, hourly between 07:00 and 19:00.

## Important Note:
This container has to be started in with [extended privileges](https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities). This is due to the container opening vpn tunnels which are only available in the privileged mode.

## Configurations
### Volumes:
- **/srv:** the location where all the data will be copied to. Don't forget to mount this folder to your host file system to persist the data!

### Environment Variables:
- **USERNAME:** The username used for authentication with the VPN client and file share 
- **PASSWORD:** The password used for authentication with the VPN client and file share
- **VPN_URL:** The url used by the vpn client
- **SHARE_PATH:** the path which should be mounted inside the docker container
- **FOLDERS:** a _space_ seperated list of folders that should be copied to the volume (/srv)
