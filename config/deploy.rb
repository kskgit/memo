# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'book_memo_api'
set :repo_url, 'git@github.com:kskgit/book_memo_api.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/book_memo_api'
# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/cable.yml', 'config/master.key')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets')

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

set :rbenv_ruby, '2.6.5'

set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

namespace :upload do
  %w(database cable).each do |name|
    desc "upload config/#{name}.yml"
    task :"#{name}" do
      on roles(:app), in: :sequence do |host|
        execute :mkdir, '-p', "#{shared_path}/config"
        upload!("config/#{name}.yml","#{shared_path}/config/#{name}.yml")
      end
    end
  end
end