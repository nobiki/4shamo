# 4shamo

Selenium Grid + Robotframework on Docker

#### Get stated

```
// Start Selenium Hub
$ docker-compose up -d sele-hub sele-chrome sele-firefox

// Start Robotframework
$ docker-compose up -d 4shamo
```

#### How to access

* VNC -> 15900 -> chrome-node
* VNC -> 15901 -> firefox-node

#### Configuration `robot.args`

`--variable GRID_URL` and `--variable BROWSER` are absolutely necessary.  
`--outputdir` is specified based on `tests/`.

#### Testing `bootstrap.sh`

Write the test case in `bootstrap.sh`

#### What is robot.local.conf?

This is the nginx configuration file for viewing the Robotframework test report.  
If you have Nginx installed on systemd based Linux, you can set it by running `robot.local.sh`  
Since `robot.local.sh` updates the hosts file, please use it at your own risk
