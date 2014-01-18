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
  attr_reader :merge
  attr_reader :tag
  attr_reader :push
  attr_reader :checks
  
  def initialize(name, attrs)
    @name = name
    @repository = attrs['repository'] || name
    @server = attrs['server']
    @merge = attrs['merge']
    @tag = attrs['tag']
    @push = attrs['push']
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
  
  deploy_config = DeployConfig.new('.deploy.yml')
  deploy_config.apps.each do |app_name, config|
    desc "Deploy to #{app_name}"
    task app_name do
      # do we have a remote repo by this name?
      check_repo(config.repository)
      
      if config.branches && config.branches != '*' then
        check_branch(app_name, current_branch, config.branches)
      end
      
      # make sure we're up to date
      `git fetch`

      if config.checks.origin
        # have we pushed to origin?
        check_origin(current_branch)
      end
      
      if config.checks.staged
        # have we already staged HEAD?
        if config.checks.staged == true
          staging_app_name = 'staging'
        else
          staging_app_name = config.checks.staged
        end
        check_staged(deploy_config.apps[staging_app_name].repository, current_branch)
      end
      
      # deploy the current branch to master on the heroku app
      push_to_master(config.repository, current_branch)
      
      run_migrations
      
      if config.tag then
        `git tag -a #{DateTime.now.strftime(config.tag)} -m "Deployed #{current_branch} to #{app_name}"`
      end
      
      if config.push then
        `git push origin #{current_branch}:#{config.push}`
      end
    end
  end  
end
