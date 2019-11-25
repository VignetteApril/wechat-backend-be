#!/bin/bash

case "$1" in
    "")
        echo -n "please provide a parameter (start, stop, reload)."
        ;;
    start)
        echo -n "starting sidekiq..."
        RAILS_ENV=production bundle exec sidekiq -C /root/deploy_apps/youshule/shared/config/sidekiq.yml
        ;;
    stop)
        echo "stoping puma..."
        kill `cat "/root/deploy_apps/youshule/shared/tmp/pids/sidekiq.pid"`
        ;;
    reload)
        echo "reloading puma..."
        kill `cat "/root/deploy_apps/youshule/shared/tmp/pids/puma.pid"`
         RAILS_ENV=production bundle exec sidekiq -C/root/deploy_apps/youshule/shared/config/sidekiq.yml
        ;;
esac
