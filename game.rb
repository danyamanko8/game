class Game
  attr_reader :max_number, :max_attempts, :secret_num, :guessed

  def initialize(max_number:, max_attempts:)
    @max_number = max_number
    @max_attempts = max_attempts
    @secret_num = rand(@max_number + 1)
    @guessed = false
  end

  def try
    attempts = 0
    until attempts == @max_attempts || @guessed
      puts 'Enter your guess: '
      guess = gets.to_i
      attempts += 1
      puts "#{@max_attempts - attempts} left"

      if guess < secret_num
        puts 'Your guess is low'
      elsif guess > secret_num
        puts 'Your guess is high'
      elsif guess == secret_num
        puts 'Success'
        puts "You guessed secret number in #{attempts} guesses"
        @guessed = true
      end
    end

    puts "Sorry, you lost. The secret number was #{@secret_num}" unless @guessed
  end
end
puts 'Hello! Welcome to the game. Your task is to guess the generated number'
game = Game.new(max_attempts: 10, max_number: 100)
game.try
