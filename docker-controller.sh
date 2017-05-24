#!/usr/bin/env bash

TMP_PROJECT=tmp_luigipetronzo
FILE_CONFIG='.bitbucket'

function error {
    echo "Options not passed"
    helper
}

function helper {
    echo
    echo "NAME"
    echo -e "\tdocker-controller -- build a docker environment LAMP"
    echo
    echo "SYNOPSIS"
    echo -e "\tbuild [start|stop|help]"
    echo
    echo "DESCRIPTION"
    echo -e "\tThe following options are available:"
    echo
    echo -e "\tstart\tCreate three docker container (web server, php-fpm and database) and orchestrate their"
    echo
    echo -e "\tstop\tStop the environment previously created"
    echo
    echo -e "\thelp\tDisplay this help menu"
    echo
}

function start {
    docker-compose up
}

function stop {
    docker-compose stop
}

if [[ $# -eq 0 ]]; then
    error
fi

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        start)
            start
            shift
        ;;
        stop)
            stop
            shift
        ;;
        help)
            helper
            exit
        ;;
        *)
            error
            exit
        ;;
    esac
    shift # past argument or value
done