#docker-steam-rust

A docker with the [Rust](http://store.steampowered.com/app/252490/) dedicated server preconfigured (based on [docker-steam](https://github.com/Micka33/docker-steam)).  

This fork is based on [Micka33/docker-steam-rust](https://github.com/Micka33/docker-steam-rust) with the change that it exposes configuration parameters as environment variables which can be set with docker run

*Note: Currently, you need a beta password to run a Beta Rust dedicated server.*
*Right now, this docker is configured to run an Experimental Rust dedicated server.*

## Dependency

- [Docker](https://www.docker.com/)  
  - [Mac OS X](https://docs.docker.com/installation/mac/)  
  - [Ubuntu](https://docs.docker.com/installation/ubuntulinux/)  
  - [Red Hat Enterprise Linux](https://docs.docker.com/installation/rhel/)
  - [CentOS](https://docs.docker.com/installation/centos/)
  - [Debian](https://docs.docker.com/installation/debian/)
  - [Gentoo](https://docs.docker.com/installation/gentoolinux/)
  - [Google Cloud Platform](https://docs.docker.com/installation/google/)
  - [Rackspace Cloud](https://docs.docker.com/installation/rackspace/)
  - [Amazon EC2](https://docs.docker.com/installation/amazon/)
  - [IBM Softlayer](https://docs.docker.com/installation/softlayer/)
  - [Arch Linux](https://docs.docker.com/installation/archlinux/)
  - [FrugalWare](https://docs.docker.com/installation/frugalware/)
  - [Fedora](https://docs.docker.com/installation/fedora/)
  - [openSUSE](https://docs.docker.com/installation/openSUSE/)
  - [CRUX Linux](https://docs.docker.com/installation/cruxlinux/)
  - [Microsoft Windows](https://docs.docker.com/installation/windows/)


## Install it

```bash
git clone https://github.com/Micka33/docker-steam-rust.git
cd docker-steam-rust
sudo docker build -t myrustserver ./docker_files
```

## Run it

```bash
sudo docker run -d -p 28015:28105/udp -v `pwd`/mounted:/root/mounted myrustserver
```

This will run a server with all the defaults listed below.

*Allow RCON connections*

```bash
sudo docker run -d -p 28015:28105/udp -p 28016:28016 -e "RUST_RCON_PASSWORD=SomePassword" -v /data/rust:/root/mounted myrustserver
```

*To inspect/debug*
```bash
sudo docker run --rm -ti -p 27011:27015 -p 27011:27015/udp -v /data/rust:/root/mounted myrustserver /sbin/my_init  -- bash -l
```

## Configuration

These environment variables are available to use.

| Variable                 | Description                                                                                                           | Default |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------|---|
| RUST_SERVER_IP           | IP to listen to                                                                                                       | 0.0.0.0  |
| RUST_SERVER_PORT         | Port to listen to                                                                                                     | 28015  |
| RUST_SERVER_TICKRATE     | Server refresh rate (min acceptable 15, max 100) - Increasing this value increase CPU usage                           | 30  |
| RUST_SERVER_HOSTNAME     | The displayed name of your server                                                                                     | Docker Server (Experimental)  |
| RUST_SERVER_IDENTITY     | Changes path to your server data rust/server/my_server_identity. Useful for running multiple instances.               | serverdatas  |
| RUST_SERVER_LEVEL        | The map to start on. Right now should be "Procedural Map" or TestLevel                                                | Procedural Map  |
| RUST_SERVER_MAXPLAYERS   | Max amount of players your server can handle. Max : 500 or more                                                       | 50 |
| RUST_SERVER_WORLDSIZE    | Defines the size of the map generated (min 2000, max 8000)                                                            | 4000  |
| RUST_SERVER_SAVEINTERVAL | Time in seconds for server save                                                                                       | 600  |
| RUST_RCON_IP             | IP to listen to for RCON                                                                                              | 0.0.0.0 |
| RUST_RCON_PORT           | Port to listen to for RCON                                                                                            | 28016  |
| RUST_RCON_PASSWORD       | RCON Password. If you remove it after setting it up, your server won't start.                                         | YourPassword  |
| RUST_LOGFILE             | Rust log file location. | gamelog.txt  |
| RUST_SERVER_SEED         | The seed used to generate the procedural level. Should be between -2,147,483,647 and 2,147,483,647                    | 1177711122 |
| RUST_SERVER_SECURE       | VAC and EAC secured. | true |