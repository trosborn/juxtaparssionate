require 'sqlite3'

DB = SQLite3::Database.new 'job-postings.db'

module Model
  class SQLite3
    def self.save file
      DB.execute 'INSERT INTO wework values( ? )', file
    end

    def self.job_number number
      DB.execute 'INSERT INTO wework values( ? )', number
    end

    def self.most_recent
      DB.execute 'SELECT MAX(job_number) FROM wework'
    end

    def self.create_table
      DB.execute <<-SQL
      create table wework (
        body VARCHAR(32000),
        nouns int,
        noun_percent decimal(0, 2),
        job_number int
      );
      SQL
    end
  end
end




