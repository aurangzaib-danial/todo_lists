require 'sqlite3'
require 'active_record'
require 'pry' # comment out before pushing
ActiveRecord::Base.establish_connection(
  database: 'db/todo_lists.sqlite',
  adapter: 'sqlite3'
)
