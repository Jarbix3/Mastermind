# frozen_string_literal: true

class ComSolver
  attr_accessor :com_code, :exact_guess, :partial_guess, :player_code, :possible_codes

  def initialize
    @com_code = [1, 1, 2, 2]
    @exact_guess = 0
    @partial_guess = 0
    @player_code = []
    @possible_codes = generate_possible_codes
  end

  def generate_possible_codes
    (1..6).to_a.repeated_permutation(4).to_a
  end

  def com_start
    puts 'Please enter your 4-digit code: '
    @player_code = check_code.split(//).map(&:to_i)

    com_play
    result
  end

  def check_code
    input = gets.chomp
    return input if input.match(/^[1-6]{4}$/)
    return input if input.match(/^E$/)

    puts 'Please enter a valid 4-digit code: '
    check_code
  end

  def com_play
    (1..12).each do |_|
      feedback = compare_guess(com_code, player_code)
      puts "COMPUTER GUESS: #{com_code.join} \t EXACT: #{exact_guess} \t PARTIAL: #{partial_guess}"
      break if exact_guess == 4

      filter_codes(com_code, feedback)
      computer_guess
    end
  end

  def computer_guess
    self.com_code = possible_codes.sample
  end

  def compare_guess(com_code, player_code)
    self.exact_guess = 0
    self.partial_guess = 0

    temp_player_code = player_code.dup
    temp_com_code = com_code.dup

    com_code.each_with_index do |guess_num, index|
      next unless guess_num == temp_player_code[index]

      self.exact_guess += 1
      temp_player_code[index] = nil
      temp_com_code[index] = nil
    end

    temp_com_code.compact.each do |guess_num|
      if temp_player_code.include?(guess_num)
        self.partial_guess += 1
        temp_player_code[temp_player_code.index(guess_num)] = nil
      end
    end

    [exact_guess, partial_guess]
  end

  def filter_codes(last_guess, feedback)
    possible_codes.select! do |code|
      compare_guess(code, last_guess) == feedback
    end
  end

  def result
    puts "\t\t\t\tCOMPUTER WINS!!!!" if exact_guess == 4
    puts "\t\t\t\tCOMPUTER LOSES!!!!" if exact_guess != 4
  end
end
