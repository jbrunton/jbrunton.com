module HerokuHelper
  def run_migrations
    Bundler.with_clean_env do
      sh "heroku run rake db:migrate"
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
end
