require 'readline'

class Hang
  attr_accessor :dict
  :guessedWord
  :toguessWord
  :turns
    def initialize(turns)
      @turns = turns
    end
    
    def play
      @dict =  ["include", "split"]
      randomName
      playGame
    end
    
    def randomName
      @toguessWord = dict[rand(dict.size)]
      @guessedWord = ""
      @toguessWord.length.times do @guessedWord << "_"
      end
    end
    
    def playGame
      while @guessedWord.include? "_"
        if @turns < 1 
           lose
           return
        end
        puts @guessedWord
        local = @toguessWord
        guess = Readline.readline('> ',true).downcase   
        while local.include? guess 
          @guessedWord[local.rindex(guess)]= guess
          local = local.slice(local.rindex(guess)+1..local.length)          
        end
        if !@toguessWord.include? guess
          @turns -= 1
          puts "Letter " + guess + " is not in the word! You have " + @turns.to_s + " turns left"
        end
      end
      puts "You WON!!! The word was: " + @toguessWord  
   end
   
   def lose
     puts "you lost the game"
   end
   
end

a = Hang.new(6)
a.play()