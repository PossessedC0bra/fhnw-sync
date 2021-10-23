# FHNW-Sync
A docker container that runs a cron job, which automatically connects to a vpn, mounts a given file server and copies the specified folders to its filesystem.

## Important Note:
This container has to be started with [extended privileges](https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities). This is due to the container opening vpn tunnels which are only available in the privileged mode.

## Configurations
### Volumes:
- `/srv` the location where all the data will be copied to. Don't forget to mount this folder to your host filesystem to persist the data!

### Environment Variables:
- `CRON_SCHEDULE` The cron schedule defining when the sync job is run. (**Default:** [0 9-17 * * *](https://crontab.guru/#0_7-19_*_*_*))
- `USERNAME` The username used for authentication with the VPN client and file share 
- `PASSWORD` The password used for authentication with the VPN client and file share
- `VPN_URL` The url used by the vpn client
- `SHARE_PATH` the path which should be mounted inside the docker container
- `FOLDERS` a _space_ seperated list of folders that will be copied to the filesystem
