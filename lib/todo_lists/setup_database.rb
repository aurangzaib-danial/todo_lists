if !File.exists? "#{Dir.home}/.todo_lists"

DB = SQLite3::Database.new "#{Dir.home}/.todo_lists"

items_sql = <<-SQL
  CREATE TABLE IF NOT EXISTS Items   (
    id INTEGER PRIMARY KEY,
    content TEXT,
    list_id INTEGER,
    done BOOLEAN DEFAULT false
  )
SQL

lists_sql = <<-SQL
  CREATE TABLE IF NOT EXISTS Lists  (
    id INTEGER PRIMARY KEY,
    title VARCHAR
  )
SQL



DB.execute(items_sql)
DB.execute(lists_sql)
end
