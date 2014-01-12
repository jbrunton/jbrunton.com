module GitHelper
  def validate_repo(repo_name)
    repos = `git remote`.strip.split(/\s+/)
    unless repos.include?(repo_name)
      raise "Could not find remote repository '#{repo_name}'"
    end
  end
end
