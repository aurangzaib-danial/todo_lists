# This file is for development purposes
ActiveRecord::Base.establish_connection(
  database: "db/todo_lists.sqlite",
  adapter: 'sqlite3'
)
