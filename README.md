# mkmap
## Make a new `maptime` wiki-map

_This will eventually become a command-line utility. For now, it's a bare bones set of shell commands._

## Getting Started

```
git clone <git url>
cd mynewmap

# Start a maptime container
make run

# After the container starts, open the wiki in your default browser.
make open
```

Any changes you make will be saved automatically in the `wiki` directory.

You can save these changes to your version control system of choice. We'll use `git` as an example.

```
# Remove the git history of the template...you're going to want your own.
rm -rf .git
git init .
git add .
git commit -am "Initial import"
```

## Docker Quickstart

If you're new to Docker, you'll need to get a Docker host running.

### OS X

Tested on macOS High Sierra, 10.13.3:

    brew install docker-compose
    brew install xhyve
    brew install docker-machine-driver-xhyve

    # Enable superuser privileges to access the hypervisor
    sudo chown root:wheel /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
    sudo chmod u+s /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

    # Restart the nfs daemon
    sudo nfsd restart

    # Create a new docker machine instance
    docker-machine -D create --driver xhyve --xhyve-experimental-nfs-share dev

    # Set environment variables to communicate with Docker
    eval $(docker-machine env dev)

    # Ensure you can connect
    docker ps
