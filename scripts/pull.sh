#!/bin/sh

set -e

pull="docker pull"

# Set default docker repository if none exist in env
if [ -z $REPOSITORY ]; then
    REPOSITORY="grounds"
fi

grounds_exec_images() {
    echo $(docker search "$REPOSITORY" | grep "$REPOSITORY/exec-" | awk -F ' ' '{ print $1 }')
}

pull_dependencies() {
    ${pull} "dockerfile/redis:latest"
    ${pull} "foliea/newrelic-redis:latest"
}

pull_grounds_exec() {
    ${pull} "$REPOSITORY/grounds-exec:latest"
}

pull_grounds_io() {
    ${pull} "$REPOSITORY/grounds.io:latest"
}

pull_grounds_exec_images() {
    for image in $(repository_exec_images); do
        ${pull} "$image"
    done 
}

# If first parameter is missing or empty
if [ -z $1 ]; then
    echo "usage: pull [dependencies|grounds_exec|grounds_io|grounds_exec_images]"
    return
fi
