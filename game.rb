# frozen_string_literal: true

require './text_instructions'
require './com_solver'
require './player'
class Game
  include InstructionsText

  def play
    puts instructions
    mode = mode_selection
    code_master if mode == '1'
    code_breaker if mode == '2'
  end

  def mode_selection
    input = gets.chomp
    return input if input.match(/^[1-2]$/)

    puts "Please enter '1' to be te code-maker or '2' to be the code-guesser(computer will never lose lol)"
    mode_selection
  end

  def code_master
    master = ComSolver.new
    master.com_start
  end

  def code_breaker
    guesser = PlayerSolver.new
    guesser.play
  end
end
