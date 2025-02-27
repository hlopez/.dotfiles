#!/bin/bash

pg_ctlcluster 11 main start

case "$1" in
  neurobank)
    branch="neurobank"
    env="neurobank"
    ;;
  production)
    branch="develop"
    env="production"
    ;;
  *)
    branch="develop"
    env="development"
    ;;
esac

home="$INTRANET_HOME/$branch"


intranet_path=$(echo $home | tr -d '\r')

for filename in $intranet_path/tmp/pids/*.pid; do
  if test -f "$filename"; then
    echo "$filename"
    sh -c "kill -s QUIT `cat $filename`"
  fi
done

command1="cd $intranet_path && bundle exec puma -e $env"
command2="bundle exec sidekiq --environment development --config $intranet_path/config/sidekiq.yml"

sh -c "./bin/rails runner apps/financial/lib/runners/create_or_update_db_stored_procs.rb"
sh -c "$command2 &"
sh -c "$command1"
RAILS_ENV=$env
