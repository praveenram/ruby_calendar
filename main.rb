require 'sqlite3'
require 'fileutils'

FileUtils.mkdir_p("db")
FileUtils.touch("db/calendar.db")

db = SQLite3::Database.new('db/calendar.db')

db.execute <<-SQL
  create table event (
    id int primary key asc not null,
    starttime real not null,
    endtime real not null,
    name text not null default "Untitled"
  );
SQL