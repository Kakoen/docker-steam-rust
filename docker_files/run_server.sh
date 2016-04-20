#!/bin/bash
cd /root/mounted
export HOME="/root"
file="./libGLU.so.1"
if ! [ -f "$file" ]
then
	ln -s /usr/lib/x86_64-linux-gnu/mesa/libGL.so.1 "$file"
fi

RUST_ARGS="-batchmode"
RUST_ARGS="$RUST_ARGS +server.hostname \"${RUST_SERVER_HOSTNAME}\""
RUST_ARGS="$RUST_ARGS +server.ip ${RUST_SERVER_IP}"
RUST_ARGS="$RUST_ARGS +server.port ${RUST_SERVER_PORT}"
RUST_ARGS="$RUST_ARGS +server.identity ${RUST_SERVER_IDENTITY}"
RUST_ARGS="$RUST_ARGS +server.seed ${RUST_SERVER_SEED}"

if [ "${RUST_SERVER_LEVEL}" != "Procedural Map" ]; then
        RUST_ARGS="$RUST_ARGS +server.level \"${RUST_SERVER_LEVEL}\""
fi

RUST_ARGS="$RUST_ARGS +server.maxplayers ${RUST_SERVER_MAXPLAYERS}"
RUST_ARGS="$RUST_ARGS +server.worldsize ${RUST_SERVER_WORLDSIZE}"
RUST_ARGS="$RUST_ARGS +server.saveinterval ${RUST_SERVER_SAVEINTERVAL}"
RUST_ARGS="$RUST_ARGS +rcon.ip ${RUST_RCON_IP}"
RUST_ARGS="$RUST_ARGS +rcon.port ${RUST_RCON_PORT}"
RUST_ARGS="$RUST_ARGS +rcon.password \"${RUST_RCON_PASSWORD}\""
RUST_ARGS="$RUST_ARGS +server.secure ${RUST_SERVER_SECURE}"
RUST_ARGS="$RUST_ARGS -logfile ${RUST_LOGFILE}"

echo Arguments: $RUST_ARGS

exec ./RustDedicated $RUST_ARGS
