require 'sqlite3'
require 'fileutils'

class Database
	def initialize
		unless File.file? "db/calendar.db"
			p "== Creating Database =="
			FileUtils.mkdir_p("db")
			FileUtils.touch("db/calendar.db")

			db = SQLite3::Database.new('db/calendar.db')

			p "== Add Event Table =="
			db.execute <<-SQL
			  create table event (
			    id int primary key asc not null,
			    starttime real not null,
			    endtime real not null,
			    name text not null default "Untitled"
			  );
			SQL
		end
		p "== Database ready! =="
	end
end