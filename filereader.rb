class People
	def initialize
		@people = []
	end

	file = ARGV.first
	puts "here's the input i got:"
	File.open(file, "r") do |f|
		f.each_line do |line|
			line = line.gsub("|", " ").gsub(",", " ")
			@people << line.split[2]
	  end
	end
	puts @people
end
