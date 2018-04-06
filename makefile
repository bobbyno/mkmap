SHELL = /usr/bin/env bash

# Customize name and image version for your project:
name = maptime-template
version = testedminds/tiddlymap:18.03.12.1

# https://devcenter.heroku.com/articles/container-registry-and-runtime#get-the-port-from-the-environment-variable
run:
	docker run -d -p 8080:8080 -v `pwd`/wiki:/var/lib/tiddlywiki/wiki -e PORT=8080 --rm --name $(name) $(version)

# run a container without mounting the local volume so that any changes to the wiki are scoped to the container:
test:
	docker run -d -p 8080:8080 -e PORT=8080 --rm --name $(name) $(version)

exec:
	docker exec -it $(name) sh

stop:
	-docker stop $(name)

open:
	open http://`docker-machine ip dev`:8080
