require 'bundler/setup'
require "require_all"
require "sinatra/activerecord"
ActiveRecord::Base.logger = Logger.new(STDOUT)

Bundler.require

require_all 'app'
