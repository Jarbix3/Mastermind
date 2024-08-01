# frozen_string_literal: true

class PlayerSolver
  attr_accessor :guess, :exact_guess, :partial_guess
  attr_reader :com_code

  def initialize
    rand_numbers = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    @com_code = rand_numbers.map(&:to_s)
    @exact_guess = 0
    @partial_guess = 0
  end

  def play
    (1..12).each do |i|
      do_turn(i)

      break if guess[0] == 'E'
      break if exact_guess == 4
    end
    result
  end

  def do_turn(n)
    puts "\nGuess ##{n}: Player, please make your 4-digit guess, or write 'E' to exit:"
    @guess = check_guess.split(//)
    self.exact_guess = 0
    self.partial_guess = 0
    compare_guess
    puts "EXACT: #{exact_guess}\t PARTIAL: #{partial_guess}"
  end

  def check_guess
    input = gets.chomp

    return input if input.match(/^[1-6]{4}$/)
    return input if input.match(/^E$/)

    puts "\nPlease make your guess again, or write 'E' to exit: "
    check_guess
  end

  def compare_guess
    temp_com_code = com_code.dup
    guess.each_with_index do |guess_num, guess_num_index|
      if guess_num == temp_com_code[guess_num_index]
        self.exact_guess += 1
        temp_com_code[guess_num_index] = ''

      elsif temp_com_code.include?(guess_num)
        self.partial_guess += 1
        temp_com_code[temp_com_code.index(guess_num)] = ''
      end
    end
  end

  def result
    puts "\n\t\t\t\tPLAYER WINS!!!!" if exact_guess == 4
    puts "\n\t\t\t\tPLAYER LOSES!!!!" if exact_guess != 4
    puts "\n\t\t\t\tThe code was: #{com_code.join}"
  end
end
