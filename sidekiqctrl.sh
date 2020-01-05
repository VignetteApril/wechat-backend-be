#!/bin/bash

case "$1" in
    "")
        echo -n "please provide a parameter (start, stop, reload)."
        ;;
    start)
        echo -n "starting sidekiq..."
        RAILS_ENV=production bundle exec sidekiq -C /root/deploy_apps/youshule/current/config/sidekiq.yml --daemon
        ;;
    stop)
        echo "stoping sidekiq..."
        kill `cat "/root/deploy_apps/youshule/shared/tmp/pids/sidekiq.pid"`
        ;;
    reload)
        echo "reloading sidekiq..."
        kill `cat "/root/deploy_apps/youshule/shared/tmp/pids/puma.pid"`
         RAILS_ENV=production bundle exec sidekiq -C/root/deploy_apps/youshule/current/config/sidekiq.yml --daemon
        ;;
esac
