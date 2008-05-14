# auto_cron_app should always be called before auto_cron_publish, because on
# the publish box it will write an app cron that will be immediately
# overwritten by the publish cron

task :auto_cron_app, :roles => :app do
  run "cd #{current_path} && rake TEMPLATE=app RAILS_ENV=#{rails_env} auto_cron"
end

task :auto_cron_publish, :roles => :publish do
  run "cd #{current_path} && rake TEMPLATE=publish RAILS_ENV=#{rails_env} auto_cron"
end

