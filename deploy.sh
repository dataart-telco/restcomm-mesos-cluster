#!/bin/bash

juju set-env "default-series=trusty"
#juju set-constraints "mem=4G cpu-cores=2"
 
juju-deployer -c bundle.yaml

JUJU_CUR_ENV=local
JUJU_PASS=$(grep password ~/.juju/environments/${JUJU_CUR_ENV}.jenv | sed 's/.*: //g')

echo 'juju admin password: '$JUJU_PASS

juju ssh juju-gui/0 ifconfig
