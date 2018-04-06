# mkmap
## Make a new `maptime` wiki-map

_This will eventually become a command-line utility. For now, it's a bare-bones set of shell commands acting as a template for new `maptime` instances._

## Getting Started

```
# Clone this template to create a new wiki
git clone https://github.com/bobbyno/mkmap.git hellomap
cd hellomap

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

At this point you're ready to push to a shared server. You can use your wiki as a personal knowledge base, or easily share it with others who can clone your repo. Assuming they also have Docker, they're a `make run open` away from becoming editors.

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
