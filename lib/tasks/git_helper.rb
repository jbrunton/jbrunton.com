module GitHelper
  def check_repo(repo_name)
    repos = `git remote`.strip.split(/\s+/)
    unless repos.include?(repo_name)
      raise "Could not find remote repository '#{repo_name}'"
    end
  end
  
  def check_origin(branch_name)
    # first, confirm the branch is on the remote repo
    branches = `git branch -r`.strip.split(/\s+/)
    unless branches.include?("origin/#{branch_name}")
      raise "Branch #{branch_name} doesn't exist in origin"
    end
    
    # now, check the local branch isn't ahead
    check_not_ahead('origin', branch_name)
  end
  
  def check_not_ahead(repo_name, branch_name)
    unless `git log #{repo_name}/#{branch_name}..#{branch_name}`.empty? then
      raise "Branch #{branch_name} is behind #{repo_name}/#{branch_name}"
    end
  end
  
  def current_branch
    current_branch = `git rev-parse --abbrev-ref HEAD`
    current_branch.strip!
  end
end
