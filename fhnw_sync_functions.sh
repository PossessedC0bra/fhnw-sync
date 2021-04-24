#!/bin/sh

# ---- VPN FUNCTIONS ----

function connectVpn() {
    echo "$PASSWORD" | openconnect -b -u $USERNAME --passwd-on-stdin $VPN_URL
}

function waitForVpn() {
    sleep 5
}

function disconnectVpn() {
    pkill openconnect
    echo "vpn disconnected"
}

# ---- MOUNT / UNMOUNT FUNCTIONS ----

function mountShare() {
    mount.cifs -o user=$USERNAME,password=$PASSWORD $SHARE_PATH $MOUNT_PATH
    echo "$SHARE_PATH mounted ON $MOUNT_PATH"
}

function unmountShare() {
    umount $MOUNT_PATH
    echo "$MOUNT_PATH unmounted"
}

# ---- SYNC FOLDER FUNCTIONS ----

function syncFolders() {
    for folder in ${FOLDERS}
    do
        fullPath=$MOUNT_PATH/$folder
        cp -ru $fullPath /srv
        echo "$fullPath copied"
    done

   echo "all folders copied"
}

# ---- ALL IN ONE FUNCTION ----

function sync() {
    connectVpn
    waitForVpn
    mountShare
    syncFolders
    unmountShare
    disconnectVpn
}
