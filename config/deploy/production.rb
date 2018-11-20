# frozen_string_literal: true

ENV_FILE_PATH = '.env.production'.freeze

require 'dotenv'
Dotenv.load(ENV_FILE_PATH)

server ENV['VPS_HOST'],
       port: ENV['VPS_SSH_PORT'],
       user: ENV['VPS_USER'],
       roles: %w[app db web]

set :deploy_to, "~/#{ENV['VPS_WWW_PATH']}/#{ENV['APP_NAME']}"
set :shared_path, "#{fetch(:deploy_to)}/shared"
set :application, ENV['APP_NAME']
set :repo_url, ENV['GIT_REPO_URL']
set :branch, ENV['GIT_REPO_BRANCH']
set :stage, :production
set :rails_env, :production

set :ssh_options, forward_agent: true, keys: %w[~/.ssh/id_rsa.pub]


namespace :deploy do

  task :copy_files do
    p '#' * 60
    p 'UPLOADING ENV FILES'
    p '_' * 60
    p '.env'
    on roles :app do
      execute "echo \"SERVER_STATUS=\"production\"\" > #{fetch(:shared_path)}/.env"
    end
    p ENV_FILE_PATH
    run_locally do
      execute "scp -P #{ENV['VPS_SSH_PORT']} #{ENV_FILE_PATH} #{ENV['VPS_USER']}@#{ENV['VPS_HOST']}:#{fetch(:shared_path)}/#{ENV_FILE_PATH}"
    end
    p '#' * 60
  end

  task :create_symlink do
    on roles :app do
      within current_path do
        p '#' * 60
        p 'CREATING SYMLINK'
        p '#' * 60
        execute "ln -sf #{fetch(:shared_path)}/.env #{fetch(:deploy_to)}/current"
        execute "ln -sf #{fetch(:shared_path)}/#{ENV_FILE_PATH} #{fetch(:deploy_to)}/current"
      end
    end
  end

  task :restart do
    on roles :app do
      within current_path do
        p '#' * 60
        p 'REBOOTING SERVER'
        p '#' * 60
        execute "kill -SIGKILL `cat #{fetch(:deploy_to)}/shared/tmp/pids/server.pid` || true && rm #{fetch(:deploy_to)}/shared/tmp/pids/server.pid || true"
        execute :bundle, "exec rails s -e production -d -p #{ENV['RUN_SERVER_PORT']}"
      end
    end
  end

  task :seed do
    on roles :app do
      within current_path do
        execute :rake, 'db:seed'
      end
    end
  end

  # task :create_db do
  #   on roles :app do
  #     p '#' * 60
  #     p 'TRYING TO CREATE DB IF NOT EXIST'
  #     p '#' * 60
  #     execute "cd #{release_path}; RAILS_ENV=production bundle; RAILS_ENV=production rake db:create || true"
  #   end
  # end

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     within release_path do
  #       execute :rake, 'assets:clean'
  #     end
  #   end
  # end


end