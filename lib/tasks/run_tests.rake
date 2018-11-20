# frozen_string_literal: true

namespace :run_tests do
  task core: :environment do
    sh 'RAILS_ENV=test rspec spec/ -t core'
  end

  task non_core: :environment do
    sh 'RAILS_ENV=test rspec spec/ -t non_core'
  end

  task all: :environment do
    sh 'RAILS_ENV=test rspec spec/'
  end

  task catch_floating: :environment do
    sh 'for i in `seq 25`; do RAILS_ENV=test rspec spec/; done'
  end
end
