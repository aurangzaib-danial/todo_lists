require "bundler/gem_tasks"
require "rspec/core/rake_task"

require 'bundler/setup'

require 'sqlite3'
require 'active_record'

require_relative 'config/environment'
require "sinatra/activerecord/rake"


RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'reset development database'
task :reset_development do
  system('rm -rf db/schema.rb')
  system('rm -rf db/todo_lists.sqlite')
  system('rake db:migrate')
end

desc 'reset production database'
task :reset_production do
  system('rm -rf ~/.todo_lists')
end
