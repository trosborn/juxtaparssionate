require 'sqlite3'

DB = SQLite3::Database.new "job-postings.db"

module Model
  class SQLite3
    def self.save file
      DB.execute "INSERT INTO wework values( ? )", file
    end
  end

  def create_table
    DB.execute <<-SQL
    create table wework (
      body VARCHAR(32000)
    );
    SQL
  end
end




