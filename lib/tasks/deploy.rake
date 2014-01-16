require_relative 'git_helper'
require_relative 'heroku_helper'

include GitHelper
include HerokuHelper

namespace :deploy do
  
  task "check:origin" do
    check_origin(current_branch)
  end
  
  YAML::load(File.open('.deploy.yml'))['apps'].each do |app_name, attrs|
    desc "Deploy to #{app_name}"
    task app_name do
      repo_name = attrs['repository'] || app_name

      # do we have a remote repo by this name?
      check_repo(repo_name)
      
      # have we pushed to origin?
      check_origin(current_branch)
      
      # push the current branch to master
      push_to_master(repo_name, current_branch)
      
      run_migrations
    end
  end  
end
