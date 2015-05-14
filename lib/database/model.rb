require 'sqlite3'

DB = SQLite3::Database.new "yolo.db"

module Model
  class SQLite3
    def save file
      rows = db.execute <<-SQL
  create table numbers (
    name varchar(30),
    val int
  );
SQL
      DB.execute "INSERT INTO wework VALUE ( ? )", file
    end
  end
end




