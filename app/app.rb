require_relative '../db/tasks.rb'
require_relative 'sanitize/sanitize.rb'

class Tasks
    include Sanitize

    attr_reader :functions

    def initialize
        @functions = FunctionsDatabase.new
    end

    def create_task(title, comment)
        if Sanitize.sanitize_input(title) != nil && Sanitize.sanitize_input(comment) != nil
            @functions.create_tasks(title, comment)
        else
            p "SQLI?"
        end
    end
end