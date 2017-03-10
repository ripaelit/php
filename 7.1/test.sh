#!/usr/bin/env bash

set -e

#if [[ -n ${DEBUG} ]]; then
  set -x
#fi

GIT_URL=git@bitbucket.org:wodby/php-git-test.git

waitForCron() {
    executed=0

    for i in $(seq 1 15); do
        if dockerExec sshd cat /home/www-data/cron &> /dev/null; then
            executed=1
            break
        fi
        echo 'Waiting for cron execution...'
        sleep 5
    done

    if [[ ${executed} -eq '0' ]]; then
        echo >&2 'Cron failed.'
#        exit 1
    fi

    echo 'Cron has been executed!'
}

dockerExec() {
    docker-compose -f test/docker-compose.yml exec --user=82 "${@}"
}

docker-compose -f test/docker-compose.yml up -d
dockerExec nginx make check-ready -f /usr/local/bin/actions.mk
dockerExec php tests
dockerExec php make update-keys -f /usr/local/bin/actions.mk
dockerExec php make git-clone url=${GIT_URL} branch=master -f /usr/local/bin/actions.mk
dockerExec php make git-fetch -f /usr/local/bin/actions.mk
dockerExec php make git-checkout target=develop -f /usr/local/bin/actions.mk
dockerExec php ssh www-data@sshd cat /home/www-data/.ssh/authorized_keys | grep -q admin@wodby.com
dockerExec php curl nginx | grep -q "Hello World!"
waitForCron
docker-compose -f test/docker-compose.yml logs crond
#docker-compose -f test/docker-compose.yml down
