pg_ctlcluster 11 main start
sh -c "kill -s QUIT `cat /Users/hlopez/Development/intranet_gna/tmp/pids/puma.pid`"
sh -c "kill -s QUIT `cat /Users/hlopez/Development/intranet_gna/tmp/pids/sidekiq-0.pid`"
sh -c "cd /Users/hlopez/Development/intranet_gna && bundle exec puma -e development -d"
sh -c "cd /Users/hlopez/Development/intranet_gna && bundle exec sidekiq --index 0 --pidfile /Users/hlopez/Development/intranet_gna/tmp/pids/sidekiq-0.pid --environment development --logfile /Users/hlopez/Development/intranet_gna/log/sidekiq.log --config /Users/hlopez/Development/intranet_gna/config/sidekiq.yml --daemon"
sh -c "cd /Users/hlopez/Development/intranet_gna && rails runner apps/financial/lib/runners/create_or_update_db_stored_procs.rb"

