#!/bin/bash
#

sudo echo "{
  "default-ulimits": {
    "nofile": { "Name": "nofile", "Hard": 1048576, "Soft": 1048576 }
  }
}" > /etc/docker/daemon.json