#!/bin/bash

sed -i -e "s:/path/to/4shamo:${PWD}:g" ${PWD}/robot.local.conf
sudo cp ${PWD}/robot.local.conf /etc/nginx/conf.d/robot.local.conf
git checkout .
sudo systemctl restart nginx

echo "127.0.0.1  robot.local" | sudo tee -a /etc/hosts
