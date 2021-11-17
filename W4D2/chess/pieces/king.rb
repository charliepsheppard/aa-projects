require_relative "piece"
require_relative "slideable"
class King
    include Slideable
    def symbol
        :♜
    end 

    private
    def move_dirs
        horizontal_dirs
    end 

    
end