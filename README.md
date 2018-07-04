# gandamu

Selenium Grid + Robotframework on Docker

#### Get stated

```
$ docker-compose up -d
```

#### how to access

* VNC -> 15900 -> chrome-node
* VNC -> 15901 -> firefox-node

#### robot.args

`--variable GRID_URL` and `--variable BROWSER` are absolutely necessary.  
`--outputdir` is specified based on `tests/`.


