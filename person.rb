require 'Date'

class Person
	attr_reader :last_name, :gender, :birthday
	
	def initialize(args)
		@first_name = args[:first_name]
		@last_name = args[:last_name]
		@gender = args[:gender]
		@color = args[:color]
		@birthday = DateTime.strptime(args[:birthday], '%m/%d/%Y')
	end

	def to_s
		"#{@last_name} #{@first_name} #{@gender} #{@color} #{@birthday.strftime('%m/%d/%Y')}"
	end
end