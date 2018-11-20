# frozen_string_literal: true

lock '~> 3.11.0'

set :use_sudo, false
set :rvm_type, :auto
set :rvm_ruby_version, '2.5.3'
set :default_shell, :bash

append :linked_files, '.env', '.env.production'

append :linked_dirs, 'log',
       'tmp/pids',
       'tmp/cache',
       'tmp/sockets',
       'public/system',
       'public/uploads', '.bundle'

set :keep_releases, 3

before 'deploy:check:linked_files', 'deploy:copy_files'
# before 'deploy:migrate', 'deploy:create_db'
after 'deploy:finished', 'deploy:create_symlink'
after 'deploy:finished', 'deploy:restart'
