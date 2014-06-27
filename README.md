# Contents
- [Introduction](#introduction)
    - [Version](#version)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Thanks](#thanks)

# Introduction
Dockerfile to build a npm registry image.

## Version
Current Version: 2.4.0

# Installation

Pull the latest or specific version of the image from the docker index.
This is the recommended method of installation as it is easier to update image
in the future.
These builds are performed by the **Docker Trusted Build** service.

```bash
docker pull burkostya/npm-registry:2.4.0-couchapp
```

Alternately you can build the image yourself.

```bash
git clone https://github.com/burkostya/npm-registry.git
cd npm-registry
docker build -t '<user>/gitlab' .
```

# Quick Start
Run container

```
docker run --name='npm-registry' -i -t --rm -p 5984:5984 \
  burkostya/npm-registry:2.4.0-couchapp
```

Couchdb with installed couchapp now available on http://localhost:5984.

Credentials:

* username: admin
* password: password

# Thanks

* @sameersbn for awesome template of container configuration
