#!/bin/bash

pg_ctlcluster 11 main start

intranet_path=$(echo $INTRANET_HOME | tr -d '\r')

for filename in $intranet_path/tmp/pids/*.pid; do
  if test -f "$filename"; then
    echo "$filename"
    sh -c "kill -s QUIT `cat $filename`"
  fi
done

command1="cd $intranet_path && bundle exec puma -e development"
command2="bundle exec sidekiq --index 0 --pidfile $intranet_path/tmp/pids/sidekiq-0.pid --environment development --logfile $intranet_path/log/sidekiq.log --config $intranet_path/config/sidekiq.yml"

if [[ $1=="d" ]]; then
  $command1="$command1 -d"
  $command2="$command2 --daemon"
fi

sh -c "rails runner apps/financial/lib/runners/create_or_update_db_stored_procs.rb"
sh -c "$command2 &"
sh -c "$command1"
