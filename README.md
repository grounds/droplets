# droplets

Build grounds DigitalOcean droplet images like in production.

In production, Grounds is using two different types of droplets:

* A droplet running docker and the whole Grounds stack inside containers.
This droplet contains also fig to launch Grounds containers.
* A droplet running docker and exposing its API to the outside world. grounds-exec
is running code inside docker containers with this API.

## Build droplet images

* Build docker host:

        docker run -e DIGITALOCEAN_API_KEY=<your digital ocean api key>
                   -e DIGITALOCEAN_CLIENT_ID=<your digital ocean client id>
                   grounds/droplets build images/docker_host.json

* Build docker API:

        Not implemented yet.

Building an image will create a snapshot on digital ocean named:

    {{ prefix }}-{{ image }}-{{ timestamp }}

e.g: `grounds-docker-host-1414376691`

## Environment variables

You can customize droplets with environment variables:

* `REPOSITORY`: Repository to look for Grounds docker images. (default: `grounds`).
* `PREFIX`: Name prefix (default: `grounds`).
* `REGION`: DigitalOcean region (default: `Amsterdam 3`).
* `SIZE`: DigitalOcean size (default: `512mb`).


