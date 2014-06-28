# Contents
- [Introduction](#introduction)
    - [Version](#version)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Thanks](#thanks)

# Introduction
Dockerfile to build image with npm registry proxied with kappa.

## Version
Current Version: 2.4.0

# Installation

Pull the latest or specific version of the image from the docker index.
This is the recommended method of installation as it is easier to update image
in the future.
These builds are performed by the **Docker Trusted Build** service.

```bash
docker pull burkostya/npm-registry:2.4.0-kappa
```

Alternately you can build the image yourself.

```bash
git clone https://github.com/burkostya/npm-registry.git
cd npm-registry
git checkout kappa
docker build -t '<user>/npm-registry' .
```

# Quick Start
Run container

```
docker run --name='npm-registry' -i -t --rm -p 5984:5984 -p 80:80 \
  burkostya/npm-registry:2.4.0-kappa
```

Couchdb with installed couchapp now available on http://localhost:5984.

Credentials:

* username: admin
* password: password

Kappa is exposed on port 80. You can use it by setting option in .npmrc:

```bash
npm config set registry http://localhost
```

# Thanks

* @sameersbn for awesome template of container configuration
