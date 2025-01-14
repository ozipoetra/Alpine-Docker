#!/bin/sh -e
# ssh -o StrictHostKeyChecking=accept-new -R $SERVEO:22:localhost:22 serveo.net
ssh -o StrictHostKeyChecking=accept-new $SERVEO@ssh-j.com -N -R $SERVEO:22:localhost:22
