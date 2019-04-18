#!/bin/bash

if [ ! -e /bootstrap.lock ]; then

    pip install selenium==3.13.0 robotframework==3.0.4 \
        robotframework-seleniumlibrary==3.3.1 \
        robotframework-httplibrary

    touch /bootstrap.lock
fi

BUILDTAG=`pwgen -A -0 -1 10`
export BUILDTAG=${BUILDTAG}
echo "BUILDTAG: ${BUILDTAG}"

robot -A robot.args -v BUILDTAG:${BUILDTAG} entry.robot

# robot -A robot.args -v BUILDTAG:${BUILDTAG} -t このテスト -t あのテスト client.robot
