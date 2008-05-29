#!/usr/bin/env ruby
require 'config/boot'
require 'config/environment'
require 'rails_generator'
require 'rails_generator/scripts/generate'

Rails::Generator::Scripts::Generate.new.run(%w(auto_cron))
