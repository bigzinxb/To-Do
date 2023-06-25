require_relative '../db/tasks.rb'
require_relative 'sanitize/sanitize.rb'

class Tasks < FunctionsDatabase
    include Sanitize

    attr_reader :functions

    def initialize
        @functions = FunctionsDatabase.new
    end

    def create_task(title, comment)
        if Sanitize.sanitize_input(title) != nil && Sanitize.sanitize_input(comment) != nil
            @functions.create_tasks(title, comment)
        else
            puts "SQLI?"
        end
    end

    def update_task(title_update, comment_update, id_task)
        if Sanitize.sanitize_input(title_update) != nil && Sanitize.sanitize_input(comment_update) != nil && Sanitize.sanitize_input(id_task) != nil
            @functions.update_tasks(title_update, comment_update, id_task)
        else
            puts "SQLI?"
        end
    end

    def delete_task(id_task)
        if Sanitize.sanitize_input(id_task) != nil
            @functions.delete_tasks(id_task)
        else
            puts "SQLI?"
        end
    end
end