#!/bin/bash

case "$1" in
    "")
        echo -n "please provide a parameter (start, stop, reload)."
        ;;
    start)
        echo -n "starting puma..."
        bundle exec puma -C /data/applications/pantrysbest-cacaoh-backend/shared/config/puma.rb
        ;;
    stop)
        echo "stoping puma..."
        kill `cat "/root/deploy_apps/youshule/shared/tmp/pids/puma.pid"`
        ;;
    reload)
        echo "reloading puma..."
        kill `cat "/root/deploy_apps/youshule/shared/tmp/pids/puma.pid"`
        bundle exec puma -C /data/applications/pantrysbest-cacaoh-backend/shared/config/puma.rb
        ;;
esac
