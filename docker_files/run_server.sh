#!/bin/sh
cd /root/mounted
export HOME="/root"
file="./libGLU.so.1"
if ! [ -f "$file" ]
then
	ln -s /usr/lib/x86_64-linux-gnu/mesa/libGL.so.1 "$file"
fi


exec ./RustDedicated -batchmode +server.hostname ${RUST_SERVER_HOSTNAME} +server.ip ${RUST_SERVER_IP} +server.port ${RUST_SERVER_PORT} +server.identity ${RUST_SERVER_IDENTITY} +server.seed ${RUST_SERVER_SEED} +server.level ${RUST_SERVER_LEVEL} +server.maxplayers ${RUST_SERVER_MAXPLAYERS} +server.worldsize ${RUST_SERVER_WORLDSIZE} +server.saveinterval ${RUST_SERVER_SAVEINTERVAL} +rcon.ip ${RUST_RCON_IP} +rcon.port ${RUST_RCON_PORT} +rcon.password ${RUST_RCON_PASSWORD} +server.secure ${RUST_SERVER_SECURE} -logfile ${RUST_LOGFILE}
