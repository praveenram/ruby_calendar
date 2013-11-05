require 'sqlite3'
require 'fileutils'

class Database

	def initialize name=nil
		db_name_suffix = name.empty? ? "" : "_#{name}"
		db_name = "db/calendar#{db_name_suffix}.db"
		unless File.file? db_name
			p "== Creating Database =="
			FileUtils.mkdir_p("db")
			FileUtils.touch(db_name)

			db = SQLite3::Database.new(db_name)

			p "== Add Event Table =="
			db.execute <<-SQL
			  create table events (
			    id INTEGER PRIMARY KEY AUTOINCREMENT not null,
			    start_time text not null,
			    end_time text not null,
			    name text not null default "Untitled"
			  );
			SQL
		end
		p "== Database ready! =="
	end

	def insert_record table_name, column_value_hash
		db = SQLite3::Database.new('db/calendar.db')
		column_names = (column_value_hash.keys.map do |key| key.to_s end).join(", ")
		values = (column_value_hash.values.map do |key| "'#{key}'" end).join(", ")
		db.execute("INSERT INTO #{table_name} (#{column_names}) VALUES (#{values})")
	end
end