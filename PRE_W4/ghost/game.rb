


class Game

    def initialize
        @player_1 = 
        @fragment = ""
        path = "dictionary.txt"
        text = File.read(path)
        text_array = text.split("\n")
        dictionary_hash = Hash.new
        text_array.each { |word| dictionary_hash[word] = word }
        @dictionary = dictionary_hash
    end

    def play_round


    end







end


g = Game.new







