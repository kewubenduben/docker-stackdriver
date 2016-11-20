#!/usr/bin/env bash

service stackdriver-agent restart

while true; do echo stackdriver-loop; sleep 60; done
