class AutoCronGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      dest_template_dir = 'config/auto_cron'
      m.directory dest_template_dir
      Dir.entries( File.dirname(__FILE__) + "/templates" ).each do |entry|
        unless %w( . .. ).include?( entry )
          dest_template_file = File.join( dest_template_dir, entry )
          m.file entry, dest_template_file
        end
      end
    end
  end
end
