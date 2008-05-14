require File.dirname(__FILE__) + "/../lib/auto_cron"

desc "Generates the auto-cron and saves it to the crontab"
task :auto_cron do
  require 'tempfile'
  cron_body = AutoCron.auto_cron ENV['TEMPLATE']
  tmp_cron_path = Tempfile.new( 'auto_cron' ).path
  File.open( tmp_cron_path, File::WRONLY | File::APPEND ) do |file|
    file << cron_body
  end
  sh "crontab #{ tmp_cron_path }"
end
