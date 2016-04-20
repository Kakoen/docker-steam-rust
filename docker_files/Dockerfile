FROM      phusion/baseimage
ENV       HOME /root
RUN       /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD       ["/sbin/my_init"]

# SteamCMD is a 32-bit binary, 32-bit libraries are required -- Seriously?
RUN       dpkg --add-architecture i386
# We add these two repo for libglu
RUN 	    (echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list) && \
          (echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list)
RUN       apt-get -y update
RUN       apt-get -y install lib32gcc1 libglu1-mesa libxcursor1 wget

WORKDIR   /etc/service/steamcmd

# Gets SteamCMD
RUN       (wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz) && \
          (tar -xzf steamcmd_linux.tar.gz) && (rm steamcmd_linux.tar.gz)

# Add configuration file
ADD        ./steamcmd.cmd /etc/service/steamcmd/steamcmd.cmd

# Install the server on startup
RUN       (echo "#!/bin/sh\ncd /etc/service/steamcmd\n./steamcmd.sh +runscript steamcmd.cmd\n" > /etc/rc.local)

# Creates server as a service
ADD        ./run_server.sh /etc/service/steamcmd/run
RUN       chmod +x ./run

# Cleans up APT when done.
RUN        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# IP to listen to
ENV RUST_SERVER_IP "0.0.0.0"

# Port to listen to
ENV RUST_SERVER_PORT "28015"

# Server refresh rate (min acceptable 15, max 100) - Increasing this value increase CPU usage
ENV RUST_SERVER_TICKRATE "30"

# The displayed name of your server
ENV RUST_SERVER_HOSTNAME "Docker Server (Experimental)"

# Changes path to your server data rust/server/my_server_identity. Useful for running multiple instances.
ENV RUST_SERVER_IDENTITY "serverdatas"

# The map to start on. Right now should be "Procedural Map" or TestLevel
ENV RUST_SERVER_LEVEL "Procedural Map"

# Max amount of players your server can handle. Max : 500 or more
ENV RUST_SERVER_MAXPLAYERS "50"

# Defines the size of the map generated (min 2000, max 8000)
ENV RUST_SERVER_WORLDSIZE "4000"

# Time in seconds for server save
ENV RUST_SERVER_SAVEINTERVAL "600"

# IP to listen to for RCON
ENV RUST_RCON_IP "0.0.0.0"

# Port to listen to for RCON
ENV RUST_RCON_PORT "28016"

# RCON Password. If you remove it after setting it up, your server won't start.
ENV RUST_RCON_PASSWORD "YourPassword"

# If you're using a script, you'd better put the current date as a filename, otherwise, it'll be erased on every start.
ENV RUST_LOGFILE "gamelog.txt"

# The seed used to generate the procedural level. Should be between -2,147,483,647 and 2,147,483,647
ENV RUST_SERVER_SEED "1177711122"

# VAC and EAC secured.
ENV RUST_SERVER_SECURE "true"

