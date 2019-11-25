rails_env = ENV['RAILS_ENV'] || "production"

if rails_env == 'production'
  threads 2, 16

  # 可以选择不监听tcp端口，只监听unix socket
  environment ENV.fetch("RAILS_ENV") { "production" }

  # 定义一个项目目录的变量
  project_tmp_dir = '/root/deploy_apps/youshule/shared/tmp'

  pidfile "#{project_tmp_dir}/pids/puma.pid"
  bind "unix://#{project_tmp_dir}/sockets/puma.sock"
  state_path "#{project_tmp_dir}/sockets/puma.state"

  quiet
  threads 0, 16
  workers 2
  daemonize true
else
  threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
  threads threads_count, threads_count
  port        ENV.fetch("PORT") { 3000 }
  environment ENV.fetch("RAILS_ENV") { "development" }
  plugin :tmp_restart
end