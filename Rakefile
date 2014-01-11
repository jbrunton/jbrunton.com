# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

JbruntonCom::Application.load_tasks

namespace :deploy do
  task :staging do
    current_branch = `git rev-parse --abbrev-ref HEAD`
    current_branch.strip!
    sh "git push staging #{current_branch}:master"
  end
end
