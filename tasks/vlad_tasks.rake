# Support for Vlad the Deployer.  Only loaded if you have Vlad installed.

begin
  require 'vlad'
  namespace :vlad do
    desc "Update App Cron Jobs"
    remote_task :auto_cron_app, :roles => :app do
      run "cd #{current_path} && rake TEMPLATE=app RAILS_ENV=#{rails_env} auto_cron"
    end
  
    desc "Update Publish Cron Jobs"
    remote_task :auto_cron_publish, :roles => :publish do
      run "cd #{current_path} && rake TEMPLATE=publish RAILS_ENV=#{rails_env} auto_cron"
    end
  end
rescue LoadError
  # do nothing
end