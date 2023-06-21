require 'sqlite3'

module TasksDataBase

    class FunctionsTask

        attr_reader :db

        def self.initialize
            @db = SQLite3::Database.new  "tasks.db"
            self.create_table
        end

        def self.create_task(title, comment)
            @db.execute("INSERT INTO Tasks VALUES (null,?,?)", title, comment)
        end

        def self.read_task
            @db.execute("SELECT * FROM Tasks")
        end

        def self.update_task(title, comment)
            @db.execute("UPDATE Tasks SET title_task = ?, comment_task = ?", title, comment)
        end

        def self.delete_task(title, comment)
            @db.execute("DELETE FROM Tasks WHERE title_task IS ? AND comment_task IS ?", title, comment)
        end

        private
        def self.create_table
            @db.execute("CREATE TABLE 'Tasks' (
                'id_task'	INTEGER,
                'title_task'	TEXT,
                'comment_task'	TEXT,
                PRIMARY KEY('id_task' AUTOINCREMENT)
            );")
        end
    end
end