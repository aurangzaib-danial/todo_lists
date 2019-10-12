require "todo_lists/version"
require 'sqlite3'
require 'active_record'
require 'todo_lists/setup_database'

ActiveRecord::Base.establish_connection(
  database: "#{Dir.home}/.todo_lists",
  adapter: 'sqlite3'
)

require 'todo_lists/models/list'
require 'todo_lists/models/item'

require 'todo_lists/controllers/cli'
require 'todo_lists/controllers/lists_controller'
require 'todo_lists/controllers/items_controller'

# create a database in the home directory if not exists
# establish_connection to the home directory database
#
