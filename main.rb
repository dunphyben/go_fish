require './lib/go_fish'

def play_game
  puts "\nPress 'n' for new game, or 'x' to exit\n"
  game = gets.chomp

  case game
  when 'n'
    new_game
  when 'x'
    "OK, go learn Poker"
  end
end

def new_game

  rules =
      # "\'*\'*30\nRULES:\n_____\n
      # \n\n
        "\tRULES:\n\tEach player starts with 5 cards. When it is your turn, ask the other player
        for a card that will match your cards. The goal is to get ALL FOUR cards in a suit,
        such as all four KINGS. Once you have all four cards of a suit, you lay them down
        in front of you. This is known as a BOOK. If the other player does not have the card
        you ask for, you will be asked to GO FISH, and you will be given a card from the deck.
        The person with the most books when the deck is gone wins! Fuck Yea! Murica.\n\n"
      #\'*\'*30

  print "\nWelcome to GO FISH. How many players?\n"
  new_game = gets.chomp

  case new_game
  when '1'
    puts "Sorry! Go play solitaire, loser!"
    new_game
  when '2'
      puts rules
      Card.setup_deck
      player1 = Player.new
      player2 = Player.new
      start_game
    # come back and add additional players using the logic
    # like 'start_game +1 player' or something
  end
end


def start_game


  puts "Press 'a' to ask for a card"

  turn = gets.chomp

  case turn
  when'a'
    ask_for_card
    turn#.switch
  end
end


def ask_for_card


end





#   while true do
#     puts "Player 1 turn"
#     player1.turn(player2)
#     if player1.winner?
#       puts "Player 1 wins!"
#       break
#     end

#     puts "Player 2 turn"
#     player2.turn(player1)
#     if player2.winner?
#       puts "Player 2 wins!"
#       break
#     end
#   end
# end

play_game
