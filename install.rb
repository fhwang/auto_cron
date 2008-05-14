require 'fileutils'

# Copy over cron templates
dest_template_dir = File.dirname(__FILE__) + "/../../../config/auto_cron"
Dir.mkdir( dest_template_dir ) unless File.exist?( dest_template_dir )
src_template_dir = File.dirname(__FILE__) + "/templates"
Dir.entries( src_template_dir ).each do |entry|
  unless %w( . .. ).include?( entry )
    src_template_file = File.join( src_template_dir, entry )
    dest_template_file = File.join( dest_template_dir, entry )
    FileUtils.cp( src_template_file, dest_template_file )
  end
end
