require 'singleton'
require 'sqlite3'

class QuestionsDataBase < SQLite3::Database

    include Singleton 

    def initialize
        super('questions_db.rb')
        # self.type_translations = true
        # self.results_as_hash = true 
    end
end

class Users 

    attr_accessor :fname, :lname 
    def initialize(ops)
        @fname = ops['fname']
        @lname = ops['lname'] 
    end

    def self.find_by_id(user_id)
        user = QuestionsDataBase.instance.execute('SELECT * FROM users WHERE id = user_id ')
    end

    def self.find_by_name(fname, lname)
        QuestionsDataBase.instance.execute('SELECT * FROM users WHERE  AND ')
    end
end

class Questions

    def initialize(ops)
        
        @title = ops['title']
        @body = ops['body']
        @users_id = ops['users_id']
    end

    def self.find_by_id(user_id)
        user = QuestionsDataBase.instance.execute('SELECT * FROM users WHERE id = user_id ')
    end
end

