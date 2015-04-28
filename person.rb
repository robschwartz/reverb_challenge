
class Person
	attr_reader :last_name, :gender, :birthday
	
	def initialize(args)
		@first_name = args[:first_name]
		@last_name = args[:last_name]
		@gender = args[:gender]
		@color = args[:color]
		@birthday = args[:birthday]
	end


end