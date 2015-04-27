class Compiler

	def self.combine_files(*files)
		people = []
		files.each do |file|
			File.open(file, 'r') do |f|
				f.each do |line|
					File.open("full_list.txt", "a") << line.gsub("|", " ").gsub(",", " ") 
				end
			end
		end
	end

	# def self.read_file(file)
	# 	people = []
	# 	File.open(file, "r") do |f|
	# 		f.each_line do |line|
	# 			line = line.gsub("|", " ").gsub(",", " ")
	# 			people << line
	# 		end
	# 	end
	# 	people
	# end
end

Compiler.combine_files("space_names.txt", "pipe_names.txt", "comma_names.txt")
# file = ARGV.first
# puts "here's the input i got:"
# p People.read_file(file)