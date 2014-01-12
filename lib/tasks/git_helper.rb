module GitHelper
  def validate_repo(repo_name)
    repos = `git remote`.strip.split(/\s+/)
    unless repos.include?(repo_name)
      raise "Could not find remote repository '#{repo_name}'"
    end
  end
  
  def validate_head(branch_name)
    # first, confirm the branch is on the remote repo
    branches = `git branch -r`.strip.split(/\s+/)
    unless branches.include?("origin/#{branch_name}")
      raise "Branch #{branch_name} doesn't exist in origin"
    end
    
    # now, check the local branch isn't ahead
    if `git log origin/#{branch_name}..#{branch_name}` then
      raise "Branch #{branch_name} is behind origin/#{branch_name}"
    end
  end
  
  def current_branch
    current_branch = `git rev-parse --abbrev-ref HEAD`
    current_branch.strip!
  end
end
