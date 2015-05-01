require_relative 	'person.rb'
require_relative 	'sorter.rb'
require_relative	'runner.rb'
require 					'pry'
require 					'awesome_print'

class Compiler

# add more data to the full name file
	def self.add_file(file)
		new_file = File.open("full_list.txt", "a+")
		File.open(file, "r") do |f|
			f.each do |line|
				new_file << line.gsub("|", " ").gsub(",", " ")
			end
		end
		# needed to end the program in order for the data to appear in the file. 
		p "The full list is now ready. Please run the program again to see your data."
		Runner.run
	end

# reading the full list file
	def self.read_file
		people = []
		if File.exist?("full_list.txt") 
			File.open("full_list.txt", "r") do |f|
				f.each_line do |line|
					p line
					l = line.split
					people << Person.new(last_name: l[0], first_name: l[1], gender: l[2], color: l[3], birthday: l[4])
				end
			end
			# p people
			# binding.pry
			Sorter.sort_list(people)
		else
			p "Please run the 'add' command first to generate the file."
			Runner.run
		end
	end

# to reset the full list
	def self.reset_file
		if File.exist?("full_list.txt") 
			File.delete("full_list.txt")
			p "File is now empty"
			Runner.run
		else
			p "Please run the 'add' command first to generate the file."
			Runner.run
		end
	end

end

# runs the program
Runner.run