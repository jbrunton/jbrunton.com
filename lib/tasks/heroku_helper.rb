module HerokuHelper
  def run_migrations
    Bundler.with_clean_env do
      sh "heroku run rake db:migrate"
    end
  end
  
  def push_to_master(repo_name, branch_name)
    sh "git push #{repo_name} #{branch_name}:master"
  end
end
