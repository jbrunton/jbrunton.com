require_relative 'git_helper'
include GitHelper

namespace :deploy do
  task :validate_staging do
    validate_repo('staging')
  end
  
  task :validate_head do
    validate_head(current_branch)
  end
  
  task :push_changes => [:validate_head] do
    sh "git push staging #{current_branch}:master"
  end
  
  task :run_migrations do
    Bundler.with_clean_env do
      sh "heroku run rake db:migrate"
    end
  end
  
  desc "Deploy the current branch to the staging Heroku repository"
  task :staging => [:validate_staging, :push_changes, :run_migrations]
end
