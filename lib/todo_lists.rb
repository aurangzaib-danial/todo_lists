require "todo_lists/version"

require_relative '../config/environment'

ActiveRecord::Migration.check_pending!

require 'todo_lists/models/list'
require 'todo_lists/models/item'

require 'todo_lists/controllers/cli'
require 'todo_lists/controllers/list_controller'
