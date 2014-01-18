module HerokuHelper
  def run_migrations(app_name)
    Bundler.with_clean_env do
      heroku_run("rake db:migrate", app_name)
    end
  end
  
  def check_branch(app_name, current_branch, expected_branches)
    if (expected_branches.kind_of?(String) && expected_branches != current_branch) ||
      (expected_branches.kind_of?(Array) && !expected_branches.include?(current_branch))
    then
      raise "Cannot deploy branch #{current_branch} to #{app_name}"
    end
  end
  
  def push_to_master(repo_name, branch_name)
    sh "git push #{repo_name} #{branch_name}:master"
  end
  
  def heroku_exec(cmd, app_name)
    sh "heroku cmd --app #{app_name}"
  end
  
  def heroku_run(cmd, app_name)
    heroku_exec("run #{cmd}", app_name)
  end
end
