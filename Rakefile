# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

JbruntonCom::Application.load_tasks

namespace :backup do
  BACKUP_DIR = '/Users/John/Dropbox/Public/jbrunton.com/backups'
  
  [:development, :staging, :production].each do |env|
    env_name = env.to_s
    app_name = "jbrunton-com-#{env_name}"
    
    namespace env.to_s do

      desc "backup database locally from #{env.to_s}"
      task :create do
        raise "Expected backup directory #{BACKUP_DIR} to exist" unless File.exists?(BACKUP_DIR)

        DEST_DIR = File.join(BACKUP_DIR, env.to_s)
        Dir.mkdir(DEST_DIR) unless File.exists?(DEST_DIR)

        sh "heroku pgbackups:capture --expire --app #{app_name}"
        DEST_PATH = File.join(DEST_DIR, "#{Time.now.getutc}.dump")

        sh "curl -o '#{DEST_PATH}' `heroku pgbackups:url --app #{app_name}`"
    
        LATEST_PATH = File.join(DEST_DIR, 'latest.dump')
        sh "ln -sf '#{DEST_PATH}' #{LATEST_PATH}"
      end
  
      task :restore do
        DROPBOX_URL = "https://dl.dropboxusercontent.com/u/25389103/jbrunton.com/backups/#{app_name}/latest.dump"
        sh "heroku pgbackups:restore DATABASE '#{DROPBOX_URL}' --app #{app_name} --confirm #{app_name}"
      end
    end
  end
end
