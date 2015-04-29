# require_relative 'filereader.rb'

# start program
class Runner
  def self.run
    puts "Please type to 'add', 'read', or 'reset' the full list. Please type 'done' when you are finished"
    command = gets.chomp
    case command
      when "add"
        puts "Add a file please (comma_names.txt, space_names.txt, or pipe_names.txt)"
        file = gets.chomp
        Compiler.add_file(file)
      when "reset"
        Compiler.reset_file
      when "read"
        Compiler.read_file
      when "done"
        puts "Thank you! Until next time..."
    end
  end
end
