class Sorter
	def self.sort_list(people)
		puts "How would you like your data sorted?"
		puts "Enter 'gender', 'birthday', or 'last name'"
		sort = gets.chomp
		case sort
		when 'gender'
			self.gender_sort(people)
		when 'birthday'
			self.birthday_sort(people)
		when 'last name'
			self.last_name_sort(people)
		end

		puts "Here is the data:"
		puts "----------------"
		puts people.join("\n")
		puts "=========================="
		Runner.run
	end

	def self.gender_sort(people)
		people.sort!{|a, b| [a.gender, a.last_name] <=> [b.gender, b.last_name]}
	end

	def self.birthday_sort(people)
		people.sort!{|a, b| a.birthday <=> b.birthday}
	end

	def self.last_name_sort(people)
		people.sort!{|a, b| b.last_name <=> a.last_name}
	end

end