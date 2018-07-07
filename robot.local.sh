#!/bin/bash

sed -i -e "s:/path/to/gandamu:${PWD}:g" ${PWD}/robot.local.conf
sudo ln -s ${PWD}/robot.local.conf /etc/nginx/conf.d/robot.local.conf
sudo systemctl restart nginx
