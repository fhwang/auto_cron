# auto_cron_app should always be called before auto_cron_publish, because on
# the publish box it will write an app cron that will be immediately
# overwritten by the publish cron

task :auto_cron_app, :roles => :app do
  run "cd #{current_path} && rake TEMPLATE=app RAILS_ENV=#{rails_env} auto_cron"
end

task :auto_cron_publish, :roles => :publish do
  run "cd #{current_path} && rake TEMPLATE=publish RAILS_ENV=#{rails_env} auto_cron"
end

desc "Connects to each box individuall and installs the specifed cron 
      USAGE:: role :publish_cron, 'prilb', :crontab => 'cron' " 
task :publish_crons, :roles => :publish_cron do
  find_servers_for_task( current_task ).each do |sd|
    establish_connections_to( sd )
    targets = []
    targets.push sessions[sd]
    
    Command.process( "cd #{current_path} && rake TEMPLATE=#{sd.options[:crontab]} RAILS_ENV=#{rails_env} auto_cron", 
                      targets, options.merge(:logger => logger), &block)
                      
    logger.debug "creating crontab:#{sd.options[:crontab]} on #{sd.host}"
  end
end

