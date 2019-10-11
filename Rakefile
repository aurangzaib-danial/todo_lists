require "bundler/gem_tasks"
require "rspec/core/rake_task"

require 'bundler/setup'

require_relative 'config/environment'
require "sinatra/activerecord/rake"


RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'reset database'
task :reset_db do
  system('rm -rf db/schema.rb')
  system('rm -rf db/todo_lists.sqlite')
  system('rake db:migrate')
end
