pg_ctlcluster 9.3 main start
sh -c "kill `cat /Users/hlopez/Development/sisne/tmp/pids/unicorn.pid`"
sh -c "cd /Users/hlopez/Development/sisne; bundle exec unicorn_rails -E development -D -c config/unicorn.rb"
