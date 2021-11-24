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

    def authored_question(author_id)
        Question.find_by_author_id(author_id)
    end

    def authored_replies(user_id)
        Reply.find_by_user_id(user_id)
    end
end

class Question

    attr_accessor :title, :body, :users_id

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

    def self.find_by_author_id(author_id)
        question = QuestionsDataBase.instance.execute(<<-SQL, author_id)
            SELECT *
            FROM questions
            WHERE id = ?
        SQL

        return nil if question.nil?
        Question.new(question.first)
    end

    def author
        User.find_by_id(@users_id)
    end

    def replies(id)
        Reply.find_by_question_id(id)
    end
end

class Reply

    attr_accessor :replied_id, :users_id, :reply_id

    def initialize(ops)
        @replied_id = ops['replied_id']
        @users_id = ops['users_id']  
        @reply_id = ops['reply_id']
    end

    def self.find_by_user_id(user_id)
        user = QuestionsDataBase.instance.execute(<<-SQL, user_id)
            SELECT *
            FROM replies
            WHERE users_id = ?;
        SQL

        return nil if user.nil?
        Reply.new(user.first)
    end

    def self.find_by_question_id(question_id)
        question = QuestionsDataBase.instance.execute(<<-SQL, question_id)
            SELECT *
            FROM replies
            WHERE replied_id = ?
        SQL

        return nil if question.nil?
        Reply.new(question.first)
    end

    def author
        User.find_by_id(@users_id)
    end

    def question
        Question.find_by_author_id(@reply_id)
    end
end

