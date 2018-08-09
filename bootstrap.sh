#!/bin/bash

BUILDTAG=`pwgen -A -0 -1 10`
export BUILDTAG=${BUILDTAG}
echo "BUILDTAG: ${BUILDTAG}"

robot -A robot.args entry.robot

# robot -A robot.args -t このテスト -t あのテスト client.robot
