require_relative '../db/tasks.rb'
require_relative 'sanitize/sanitize.rb'

class Tasks
    include Sanitize
    include TasksDataBase

    def create_task(title, comment)
        if Sanitize.sanitize_input(title) != nil && Sanitize.sanitize_input(comment) != nil
            query_tasks = TasksDataBase::FunctionsTask.new
            query_tasks.insert_task(title, comment)
        end

        puts "Ta tentando SQLI seu poha"
    end
end