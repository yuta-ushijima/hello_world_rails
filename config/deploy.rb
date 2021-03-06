# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "hello_world_rails"
set :repo_url, "git@github.com:yuta-ushijima/hello_world_rails.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/#{fetch(:application)}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true
#
# append :linked_files, "config/database.yml"

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push("config/database.yml")

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push("config/master.key")

# symlink for database.yml
set :linked_files, %w[config/database.yml config/master.key]

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/packs", ".bundle", "node_modules"

set :rbenv_type, :user
set :rbenv_ruby, "2.6.1"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w[rake gem bundle ruby rails]
set :rbenv_roles, :all

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 3

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
set :ssh_options, keepalive: true, keepalive_interval: 60

# INFO: https://github.com/rails/webpacker/blob/3d67f9c1b1c9054ec4f142947a50c1d965f279dc/docs/deployment.md#capistrano
before "deploy:assets:precompile", "deploy:yarn_install"
namespace :deploy do
  desc "Run rake yarn install"
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install --silent --no-progress --no-audit --no-optional")
      end
    end
  end
end
