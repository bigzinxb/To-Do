class TasksDataBase
    attr_reader :db

    def initialize
        @db = SQLite3::Database.new  "tasks.db"
    end

    def create_task(title, comment)
        @db.execute("INSERT INTO Tasks VALUES (null,?,?)", title, comment)
    end

    def read_task
        @db.execute("SELECT * FROM Tasks")
    end

    def update_task(title, comment)
        @db.execute("UPDATE Tasks SET title = ", title , ", comment = ", comment)
    end

    def delete_tasks(title, comment)
        @db.execute("DELETE FROM Tasks WHERE title IS ", title , "AND comment IS ", comment)
    end

    private

    def create_table
    end
end