require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  database: 'db/todo_lists.sqlite',
  adapter: 'sqlite3'
)
