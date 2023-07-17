#!/bin/bash

pg_ctlcluster 9.3 main start

sisne_path=$(echo $SISNE_HOME | tr -d '\r')

pid="$sisne_path/tmp/pids/unicorn.pid"
if test -f "$pid"; then
  eval "kill `cat $pid`"
fi
command="cd $sisne_path && bundle exec unicorn_rails -E development -c config/unicorn.rb"

if [[ $1 == "d" ]]; then
  command="$command -D"
fi

sh -c "$command"
