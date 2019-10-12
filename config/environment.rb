require 'sqlite3'
require 'active_record'
require 'pry'
ActiveRecord::Base.establish_connection(
  database: 'db/todo_lists.sqlite',
  adapter: 'sqlite3'
)
