#!/bin/bash

share_puma_path="/root/deploy_apps/youshule/shared/config/puma.rb"
share_puma_pid_path="/root/deploy_apps/youshule/shared/tmp/pids/puma.pid"

case "$1" in
    "")
        echo -n "please provide a parameter (start, stop, reload)."
        ;;
    start)
        echo -n "starting puma..."
        bundle exec puma -C $share_puma_path
        ;;
    stop)
        echo "stoping puma..."
        kill `cat "${share_puma_pid_path}"`
        ;;
    reload)
        echo "reloading puma..."
        kill `cat "${share_puma_pid_path}"`
        bundle exec puma -C $share_puma_path
        ;;
esac
