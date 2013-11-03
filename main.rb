require 'sqlite3'
require 'fileutils'

FileUtils.mkdir_p("db")
FileUtils.touch("db/calendar.db")

db = SQLite3::Database.new('db/calendar.db')