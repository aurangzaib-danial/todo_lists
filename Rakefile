require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'reset database'
task :reset_db do

end

desc 'interactive console'
task :console do
  load './bin/console'
end
