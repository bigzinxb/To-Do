require 'sqlite3'

class FunctionsDatabase
    attr_reader :db

    def initialize
        @db = SQLite3::Database.new "tasks.db"
        self.create_table
    end

    def create_tasks(title, comment)
        @db.execute("INSERT INTO Tasks VALUES (null, ?, ?)", title, comment)
    end

    def read_tasks
        @db.execute("SELECT * FROM Tasks")
    end

    def update_tasks(title_update, comment_update, id_task)
        @db.execute("UPDATE Tasks SET title_task = ?, comment_task = ? WHERE id_task = ?", title_update, comment_update, id_task)
    end

    def delete_tasks(id_task)
        @db.execute("DELETE FROM Tasks WHERE id_task = ?", id_task)
    end

    private
    def create_table
        @db.execute("CREATE TABLE 'Tasks' (
            'id_task'	INTEGER,
            'title_task'	TEXT,
            'comment_task'	TEXT,
            PRIMARY KEY('id_task' AUTOINCREMENT)
        );")
    end
end
