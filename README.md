# droplets

Build grounds DigitalOcean droplet images like in production.

In production, Grounds is using two different types of droplets:

* A droplet running docker and the whole Grounds stack inside containers.
This droplet contains also fig to launch Grounds containers.
* A droplet running docker and exposing its API to the outside world. grounds-exec
is running code inside docker containers with this API.

## Build droplet images

    docker run -e DIGITALOCEAN_API_KEY=<your digital ocean api key>
               -e DIGITALOCEAN_CLIENT_ID=<your digital ocean client id>
               grounds/droplets

## Environment variables

You can customize droplets with environment variables:

* `REPOSITORY`: Repository to look for Grounds docker images. (default: `grounds`).
* `REGION`: DigitalOcean region (default: `Amsterdam 3`).
* `SIZE`: DigitalOcean size (default: `512mb`).


