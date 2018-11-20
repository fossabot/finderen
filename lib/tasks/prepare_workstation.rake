# frozen_string_literal: true

namespace :prepare_workstation do
  task development: :environment do
    # makes scripts executable
    `chmod +x #{Rails.root}/scripts/development/setup_local_domain.sh`
    `chmod +x #{Rails.root}/scripts/development/create_nginx_symlink.sh`
    `chmod +x #{Rails.root}/scripts/development/create_env_files.sh`

    # run preparation scripts
    sh "#{Rails.root}/scripts/development/setup_local_domain.sh"
    sh "#{Rails.root}/scripts/development/create_nginx_symlink.sh"
    sh "#{Rails.root}/scripts/development/create_env_files.sh"
  end

  task production: :environment do
    # TODO make this shit
  end
end
