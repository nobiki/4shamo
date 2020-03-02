> DEPRECATED: The repository has been moved to [selenium-base](https://github.com/nobiki/docker-base/tree/master/services/selenium-base).

# 4shamo

Selenium Grid + Robotframework on Docker

#### Get stated

```
// Start Hub
$ make hub

// Start Node
$ make node
```

#### Access a node with VNC

* chrome-node: 15901-1590x
* firefox-node: 15801-1580x

If you want to scale Node, please set `SCALE` in [Makefile](https://github.com/nobiki/4shamo/blob/0345523ca5b1f89a6bb7976ad56063b8fc55e58e/Makefile#L5)

#### Configuration `robot.args`

`--variable GRID_URL` and `--variable BROWSER` are absolutely necessary.  
`--outputdir` is specified based on `tests/`.

#### Testing `bootstrap.sh`

Write the test case in `bootstrap.sh`

#### What is robot.local.conf?

This is the nginx configuration file for viewing the Robotframework test report.  
If you have Nginx installed on systemd based Linux, you can set it by running `robot.local.sh`  
Since `robot.local.sh` updates the hosts file, please use it at your own risk
