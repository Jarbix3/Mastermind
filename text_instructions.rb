# frozen_string_literal: true

# instructions for the game
module InstructionsText
  def instructions
    <<~HEREDOC
      

      Mastermind is a 1-player game against the computer.

      You can choose to be the 'code master' or the 'code guesser'.

      The code can be made up of numbers from 1 to 6.

      The 'code master' has to choose a combination of four numbers, which can be repeated more than once in the same code.


      If the 'code guesser' can't guess the code before 12 turns, the 'code master' is the winner.


      After each guess, there will be clues according to how many numbers the 'code guesser' gets right:

        (*)  In the case the number guessed is the right one and is in the correct position.
      
        (?)  In the case the number guessed is the right one but is not in the correct position

        For example:

        CODE: 1445
        GUESS: 3416
        CLUES: (*)(?)

      Would you like to be the 'code master' or the 'code guesser'?

      Press '1' to be the MASTER

      Press '2' to be the GUESSER

    HEREDOC
  end
end
