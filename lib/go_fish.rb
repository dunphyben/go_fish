

class Card
  attr_reader :suit, :value
  @@books = []

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def Card.setup_deck
    suits = ["clubs", "spades", "diamonds", "hearts"]
    values = 1..13
    @@deck = []

    suits.each do |suit|
      values.each do |value|
        Card.create(suit, value)
      end
    end
  end

  def Card.deck
    @@deck
  end

  # def Card.suits
  #   @@suits
  # end

  def Card.create(suit, value)
    new_card = Card.new(suit, value)
    new_card.add_to_deck
    new_card
  end

  def add_to_deck
    @@deck << self
  end
end


class Player
  attr_reader :hand
  def initialize
    @hand = []
    self.take_cards 5
  end

  def take_cards(number_of_cards)
    unless Card.deck.empty?
      number_of_cards.times do
        card = Card.deck.sample
        @hand << card
        Card.deck.delete card
      end
    else
      puts "Deck is empty."
    end
  end

  def has_card(value)
    match = @hand.index do |card|
      card.value == value
    end
    match
  end

  def turn(opponent)
    #place pairs
    match = opponent.has_card
    unless match.nil?
      opponent.give_card(match, self)
      self.turn opponent
    end
  end

  def give_card(number, opponent)
    card = @hand.delete_at(i)
    opponent.hand << card
  end

  def winner?
    @hand.count == 0
  end


end

