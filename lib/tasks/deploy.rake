require_relative 'git_helper'
require_relative 'heroku_helper'

include GitHelper
include HerokuHelper

class ChecksConfig
  attr_reader :origin
  attr_reader :staged
  
  def initialize(attrs)
    attrs ||= {}
    @origin = attrs['origin']
    @staged = attrs['staged']
  end
end

class AppConfig
  attr_reader :name
  attr_reader :repository
  attr_reader :server
  attr_reader :branches
  attr_reader :checks
  
  def initialize(name, attrs)
    @name = name
    @repository = attrs['repository'] || name
    @server = attrs['server']
    @branches = attrs['branches'] || '*'
    @checks = ChecksConfig.new(attrs['checks'])
  end
end

class DeployConfig
  attr_reader :apps
  
  def initialize(file_name)
    @apps = YAML::load(File.open(file_name))['apps']
    @apps.each do |app_name, attrs|
      @apps[app_name] = AppConfig.new(app_name, attrs)
    end
  end
end

namespace :deploy do
  
  task "check:origin" do
    check_origin(current_branch)
  end
  
  DeployConfig.new('.deploy.yml').apps.each do |app_name, config|
    desc "Deploy to #{app_name}"
    task app_name do
      # do we have a remote repo by this name?
      check_repo(config.repository)

      if config.checks.origin
        # have we pushed to origin?
        check_origin(current_branch)
      end
      
      # push the current branch to master
      push_to_master(config.repository, current_branch)
      
      run_migrations
    end
  end  
end
