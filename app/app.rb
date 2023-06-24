require_relative '../db/tasks.rb'
require_relative 'sanitize/sanitize.rb'

class Tasks < FunctionsDatabase
    include Sanitize

    def create_task(title, comment)
        if Sanitize.sanitize_input(title) != nil && Sanitize.sanitize_input(comment) != nil
            #querys
        end

        puts "Ta tentando SQLI seu poha"
    end
end