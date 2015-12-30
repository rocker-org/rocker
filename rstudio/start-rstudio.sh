#!/bin/bash

## Run the config
exec /usr/local/bin/config

## Then start up rstudio server via runit
runsvdir-start
