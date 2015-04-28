require_relative 'person.rb'
require_relative 'sorter.rb'
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
		if File.exist?("full_list.txt") 
			people = []
			File.open("full_list.txt", "r") do |f|
				f.each_line do |line|
					l = line.split
					people << Person.new(first_name: l[0], last_name: l[1], gender: l[2], color: l[3], birthday: l[4])
				end
			end
			Sorter.sort_list(people)
		else
			p "Please run the 'add' command first to generate the file."
		end
	end

	def self.reset_file
		if File.exist?("full_list.txt") 
			File.delete("full_list.txt")
			p "File is now empty"
		else
			p "Please run the 'add' command first to generate the file."
		end
	end

end


# Start of command line program #
puts "Please type to 'add', 'read', or 'reset' the full list"

command = gets.chomp
case command
  when "add"
  	puts "Add a file please (comma_names.txt, space_names.txt, or pipe_names.txt)"
  	file = gets.chomp
    Compiler.combine_files(file)
    Compiler.read_file
  when "reset"
    Compiler.reset_file
  when "read"
  	Compiler.read_file
end
