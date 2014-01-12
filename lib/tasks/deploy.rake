require_relative 'git_helper'
include GitHelper

namespace :deploy do
  task :validate_staging do
    validate_repo('staging')
  end
  
  desc "Deploy the current branch to the staging Heroku repository"
  task :staging => [:validate_staging] do
    current_branch = `git rev-parse --abbrev-ref HEAD`
    current_branch.strip!
    sh "git push staging #{current_branch}:master"
  end
end
