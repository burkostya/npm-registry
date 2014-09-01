# Contents
- [Introduction](#introduction)
    - [Version](#version)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Data Store](#data-store)
- [Upgrading](#upgrading)
- [Thanks](#thanks)

# Introduction
Dockerfile to build image with npm registry proxied with kappa.

## Version
Current Version: 2.5.0

# Installation

Pull the latest or specific version of the image from the docker index.
This is the recommended method of installation as it is easier to update image
in the future.
These builds are performed by the **Docker Trusted Build** service.

```bash
docker pull burkostya/npm-registry:2.5.0
```

Alternately you can build the image yourself.

```bash
git clone https://github.com/burkostya/npm-registry.git
cd npm-registry
docker build -t '<user>/npm-registry' .
```

# Quick Start
Run container

```bash
docker run --name='npm-registry' -i -t --rm \
  -p 5984:5984 -p 80:80 \
  burkostya/npm-registry:2.5.0
```

Couchdb with installed couchapp now available on http://localhost:5984.

Credentials:

* username: admin
* password: password

You can set your login and password for couchdb admin:

```bash
docker run --name='npm-registry' -i -t --rm \
  -e 'COUCHDB_ADMIN_LOGIN=<login>' \
  -e 'COUCHDB_ADMIN_PASSWORD=<password>' \
  -p 5984:5984 -p 80:80 \
  burkostya/npm-registry:2.5.0
```

Kappa is exposed on port 80. You can use it by setting option in .npmrc:

```bash
npm config set registry http://localhost
```

or adding option to every command:

```
npm --registry http://localhost
```

# Configuration

## Data Store
For data persistency you should mount a volume

```bash
/var/lib/couchdb
```

Volumes can be mounted in docker by specifying the **'-v'**
option in the docker run command.

```bash
mkdir /opt/data/npm-registry
docker run --name='npm-registry' -d \
  -p 5984:5984 -p 80:80 \
  -v /opt/data/npm-registry:/var/lib/couchdb \
  burkostya/npm-registry:2.5.0

```

# Upgrading

To upgrade to newer couchapp, follow this steps:

- Update the docker image.

```bash
docker pull burkostya/npm-registry:2.5.0
```

- Stop the currently running image

```bash
docker stop npm-registry
docker rm npm-registry
```

- Backup the application data just by coping content of mounted volume

```bash
cp -r /opt/data/npm-registry /some/npm/backup/dir/
```

- Start the image

```bash
docker run --name npm-registry -d \
  -e 'COUCHDB_ADMIN_LOGIN=<login>' \
  -e 'COUCHDB_ADMIN_PASSWORD=<password>' \
  -p 5984:5984 -p 80:80 \
  -v /opt/data/npm-registry:/var/lib/couchdb \
  burkostya/npm-registry:2.5.0
```

# Thanks

* @sameersbn for awesome template of container configuration
