#!/bin/bash
NOW="$(date +%Y%m%d_%H%M%S)"
docker build -t alfred456654/jupyterlab-rust:$NOW .
docker tag alfred456654/jupyterlab-rust:$NOW alfred456654/jupyterlab-rust:latest
