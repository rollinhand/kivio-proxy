#!/bin/bash
docker run -d --restart unless-stopped --name showcase --network=kivio c3faces-showcase
docker run -d --restart unless-stopped --name kivio-proxy --network=kivio kivio-proxy
