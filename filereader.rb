require_relative 'person.rb'
require 'awesome_print'

class Compiler

	def self.combine_files(*files)
		files.each do |file|
			File.open(file, 'r') do |f|
				f.each do |line|
					File.open("full_list.txt", "a+") << line.gsub("|", " ").gsub(",", " ")
				end
			end
		end
		p "The full list is now ready"
	end

	def self.read_file
		people = []
		File.open("full_list.txt", "r") do |f|
			f.each_line do |line|
				line = line.gsub("|", " ").gsub(",", " ").gsub("\n", " ")
				l = line.split
				people << Person.new(first_name: l[0], last_name: l[1], gender: l[2], color: l[3], birthday: l[4])
			end
		end
		self.sort_files(people)
	end

	def self.sort_files(people)
		puts "How would you like your data sorted?"
		puts "Enter 'gender', 'birthday', or 'last name'"
		sort = gets.chomp
		case sort
		when 'gender'
			p 'gender'
		when 'birthday'
			p 'birthday'
		when 'last name'
			p 'last_name'
		end
		ap people
	end

	def self.delete_file
		if File.exist?("full_list.txt") 
			File.delete("full_list.txt")
			p "File is now empty"
		else
			p "Please run the 'combine' command first to generate the file."
		end
	end

end

# Start of command line program
puts "Please type to 'combine', 'delete', or 'read' the full list"

command = gets.chomp
case command
  when "combine"
    Compiler.combine_files("space_names.txt", "pipe_names.txt", "comma_names.txt")
  when "delete"
    Compiler.delete_file
  when "read"
  	Compiler.read_file
end


# file = ARGV.first
# puts "here's the input i got:"
# p People.read_file(file)