require 'sqlite3'
require 'singleton'

class QuestionsDataBase < SQLite3::Database

    include Singleton 

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true 
    end
end

class User

    attr_accessor :fname, :lname 
    def initialize(ops)
        @fname = ops['fname']
        @lname = ops['lname'] 
    end

    def self.all
        data = QuestionsDataBase.instance.execute('SELECT * FROM users')
        data.map { |datum| User.new(datum)}
    end
    
    def self.find_by_id(user_id)
        user = QuestionsDataBase.instance.execute(<<-SQL, user_id)
            SELECT *
            FROM users
            WHERE id = ?;
        SQL

        return nil if user.nil?
        User.new(user.last)
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDataBase.instance.execute(<<-SQL, fname, lname)
            SELECT *
            FROM users
            WHERE fname = ? AND lname = ?;
        SQL

        return nil if user.nil?
        User.new(user.first)
    end
end

class Question

    def initialize(ops)
        
        @title = ops['title']
        @body = ops['body']
        @users_id = ops['users_id']
    end

    def self.find_by_user_id(user_id)
        user = QuestionsDataBase.instance.execute(<<-SQL, user_id)
            SELECT * 
            FROM questions 
            WHERE users_id = ?
        SQL
        
        return nil if user.nil?
        Question.new(user.first)
    end

    def self.find_by_athor_id(author_id)
        question = QuestionsDataBase.instance.execute(<<-SQL, author_id)
            SELECT *
            FROM questions
            WHERE id = ?
        SQL

        return nil if question.nil?
        Question.new(question.first)
    end
end

