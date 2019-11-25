require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :application_name, 'youshule'
set :domain, 'root@39.107.44.233'
set :deploy_to, '/root/deploy_apps/youshule'
set :repository, 'git@github.com:VignetteApril/youshule.git'
set :branch, 'master'
set :shared_paths, ['config/database.yml', 'config/puma.rb', 'config/secrets.yml', 'config/sidekiq.yml', 'storage', 'sidekiqctrl.sh', 'pumactrl.sh']

# 将几个set参数简化成ruby变量
deploy_to = fetch(:deploy_to)
current_path = fetch(:current_path)
shared_path = fetch(:shared_path)

task :remote_environment do
  invoke :'rvm:use', 'ruby-2.6.3'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  command %[mkdir -p "#{shared_path}/wx_pay_cert"]
  command %[chmod g+rx,u+rwx "#{shared_path}/wx_pay_cert"]

  command %[mkdir -p "#{shared_path}/storage"]
  command %[chmod g+rx,u+rwx "#{shared_path}/storage"]

  # command %{rbenv install 2.3.0}
  command %[mkdir -p "#{shared_path}/public/assets"]
  command %[chmod g+rx,u+rwx "#{shared_path}/public/assets"]

  # 在服务器项目目录的shared中创建log文件夹
  command %[mkdir -p "#{shared_path}/log"]
  command %[chmod g+rx,u+rwx "#{shared_path}/log"]

  # 在服务器项目目录的shared中创建config文件夹 下同
  command %[mkdir -p "#{shared_path}/config"]
  command %[chmod g+rx,u+rwx "#{shared_path}/config"]

  command %[touch "#{shared_path}/config/database.yml"]
  command %[touch "#{shared_path}/config/secrets.yml"]

  # puma.rb 配置puma必须得文件夹及文件
  command %[mkdir -p "#{shared_path}/tmp/pids"]
  command %[chmod g+rx,u+rwx "#{shared_path}/tmp/pids"]

  command %[mkdir -p "#{shared_path}/tmp/sockets"]
  command %[chmod g+rx,u+rwx "#{shared_path}/tmp/sockets"]

  command %[touch "#{shared_path}/config/puma.rb"]
  command %[echo "-----> Be sure to edit 'shared/config/puma.rb'."]

  # tmp/sockets/puma.state
  command %[touch "#{shared_path}/tmp/sockets/puma.state"]
  command %[echo "-----> Be sure to edit 'shared/tmp/sockets/puma.state'."]

  # log/puma.stdout.log
  command %[touch "#{shared_path}/log/puma.stdout.log"]
  command %[echo "-----> Be sure to edit 'shared/log/puma.stdout.log'."]

  # log/puma.stdout.log
  command %[touch "#{shared_path}/log/puma.stderr.log"]
  command %[echo "-----> Be sure to edit 'shared/log/puma.stderr.log'."]
  command %[echo "-----> Be sure to edit '#{shared_path}/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      command "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      # command "chown -R www-data #{deploy_to}"
      command "touch #{deploy_to}/#{current_path}/tmp/restart.txt"

      # in_path(fetch(:current_path)) do
      #   command %{mkdir -p tmp/}
      #   command %{touch tmp/restart.txt}
      # end
    end
  end
end

namespace :app do
  desc "Rails db:seed"
  task :db_seed do
    command 'echo "-----> 执行seed"'
    command "cd #{current_path} && RAILS_ENV=production rails db:seed"
  end

  desc "Rails init feature"
  task :init_feature do
    command 'echo "-----> 执行seed"'
    command "cd #{current_path} && RAILS_ENV=production rails init_feature"
  end
end

namespace :puma do
  desc "Start the application"
  task :start do
    command 'echo "-----> Start Puma"'
    command "cd #{current_path} && RAILS_ENV=production && #{shared_path}/config/pumactrl.sh start"
  end

  desc "Stop the application"
  task :stop do
    command 'echo "-----> Stop Puma"'
    command "cd #{current_path} && RAILS_ENV=production && #{shared_path}/config/pumactrl.sh stop"
  end

  desc "reStart the application"
  task :restart do
    command 'echo "-----> reStart Puma"'
    command "cd #{current_path} && RAILS_ENV=production && #{shared_path}/config/pumactrl.sh reload"
  end
end

namespace :sidekiq do
  desc "Start the sidekiq"
  task :start do
    command 'echo "-----> Start sidekiq"'
    command "cd #{current_path} && RAILS_ENV=production && #{shared_path}/config/sidekiqctrl.sh start"
  end

  desc "Stop the sidekiq"
  task :stop do
    command 'echo "-----> Stop sidekiq"'
    command "cd #{current_path} && RAILS_ENV=production && #{shared_path}/config/sidekiqctrl.sh stop"
  end

  desc "reStart the sidekiq"
  task :restart do
    command 'echo "-----> reStart sidekiq"'
    command "cd #{current_path} && RAILS_ENV=production && #{shared_path}/config/sidekiqctrl.sh reload"
  end
end
