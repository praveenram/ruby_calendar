require_relative 'database.rb'

Database.new

print "Enter your name: "
name = gets.chomp

puts <<-CLI
Welcome to #{name}'s calendar
=============================
1. Add Event
2. Exit
CLI

print "Choose an option: "
option = gets.chomp