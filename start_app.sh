#!/bin/bash
echo "Removing containers:"
/usr/bin/docker rm -f lolek1 lolek2 bolek1 bolek2 loadbalancer

echo "Running containers:"
/usr/bin/docker run -d -p :80  --name lolek1 sdavydov/lolek
/usr/bin/docker run -d -p :80  --name lolek2 sdavydov/lolek

/usr/bin/docker run -d -p :80  --name bolek1 sdavydov/bolek
/usr/bin/docker run -d -p :80  --name bolek2 sdavydov/bolek

/usr/bin/docker run -d -p 80:80 --name loadbalancer --link lolek1 --link lolek2 --link bolek1 --link bolek2 sdavydov/loadbalancer
