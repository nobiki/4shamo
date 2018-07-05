# gandamu

Selenium Grid + Robotframework on Docker

#### Get stated

```
$ docker-compose up -d
```

#### How to access

* VNC -> 15900 -> chrome-node
* VNC -> 15901 -> firefox-node

#### Configuration `robot.args`

`--variable GRID_URL` and `--variable BROWSER` are absolutely necessary.  
`--outputdir` is specified based on `tests/`.

#### Testing `bootstrap.sh`

Write the test case in `bootstrap.sh`
