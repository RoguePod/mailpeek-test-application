#!/bin/sh

> log/development.log
> log/test.log
rm -f tmp/pids/server.pid
bin/rails server -b 0.0.0.0
