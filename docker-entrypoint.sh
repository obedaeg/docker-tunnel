#!/bin/bash
autossh -N -M 0 -o StrictHostKeyChecking=false -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -4 -L 0.0.0.0:$LOCAL_PORT:$FORWARD_HOST:$FORWARD_PORT -i $KEYFILE $TUNNEL_USER@$TUNNEL_HOST
