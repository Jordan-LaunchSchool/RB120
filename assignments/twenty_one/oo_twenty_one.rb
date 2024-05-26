=begin
  Twenty-One is a card game consisting of a dealer and a player, where the
  participants try to get as close to 21 as possible without going over.

  Here is an overview of the game:
  - both participants are initially deal 2 cards from a 52-card deck.
  - the player takes the first turn, and can 'hit' or 'stay'.
  - if the player busts, he loses. If he says, it's the dealer's turn.
  - The dealer must hit until his cards add up to at least 17.
  - If he busts, the player wins. If both player and
  dealer stays, then the highest total wins.
  - If both totals are equal, then its a tie, and nobody wins.

  Nouns: card, player, dealer, deck, game, total
  Verbs: deal, hit, stay, busts

  Player:
  - hit
  - stay
  - busted?
  - total

  Dealer:
  - hit
  - stay
  - busted?
  - total
  - deal

  Participant
  Deck
    - deal
  Card
  Game
    - start
=end

class Participant
  attr_reader :cards

  def initialize
    @cards = []
  end

  def hit(shuffled_deck)
    cards << shuffled_deck.deal
  end

  def busted?
    total > 21
  end

  def total
    total = 0
    aces_counter = 0
    cards.each do |card|
      card_value = card[1]
      if card_value == 'A'
        aces_counter += 1
        total += 11
      elsif ['J', 'Q', 'K'].include?(card_value)
        total += 10
      else
        total += card_value.to_i
      end
    end

    aces_counter.times do
      if total > 21
        total -= 10
      end
    end

    total
  end
end

class Player < Participant
  def busted_message
    puts "You busted! Dealer Wins!"
  end
end

class Dealer < Participant
  def auto_stay?
    total > 17
  end

  def busted_message
    puts "The dealer busted! You win!"
  end
end

class Deck
  SUITS = ['D', 'S', 'C', 'H']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_reader :deck

  def initialize
    @deck = []
    SUITS.map do |suit|
      FACES.map do |face|
        @deck << [suit, face]
      end
    end
    scramble!
  end

  def scramble!
    deck.shuffle!
  end

  def deal
    deck.pop
  end
end

class Game
  attr_reader :shuffled_deck, :player, :dealer

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @shuffled_deck = Deck.new
  end

  def deal_cards
    2.times do
      player.cards << shuffled_deck.deal
      dealer.cards << shuffled_deck.deal
    end
  end

  def show_initial_cards
    puts ""
    puts "You have #{player.cards} with a total of #{player.total}."
    puts "The dealer has #{dealer.cards[0]} and an unknown card."
  end

  def busted?(input_total)
    input_total > 21
  end

  def stay?
    answer = nil
    loop do
      puts "Would you like to (h)it or (s)tay?: "
      answer = gets.chomp.downcase[0]
      if answer == 's'
        puts "You chose to stay. "
        break
      elsif answer == 'h'
        puts 'You chose to hit.'
        break
      else
        puts ""
        puts "That is not a valid choice. Please enter (h)it or (s)tay."
        puts "Press any key to continue..."
        gets.chomp
      end
    end
    answer == 's'
  end

  def player_turn
    loop do
      if player.busted?
        player.busted_message
        break
      end

      stay? ? break : player.hit(shuffled_deck)
      show_initial_cards
    end
  end

  def dealer_turn
    loop do
      if dealer.busted?
        dealer.busted_message
        break
      end

      if dealer.auto_stay?
        puts "The dealer has #{dealer.cards}, is on #{dealer.total} and chose to stay."
        break
      end

      puts "The dealer has #{dealer.cards}, with a total of #{dealer.total} and chose to hit."
      dealer.hit(shuffled_deck)
      puts "Press any key to continue..."
      gets.chomp
    end
  end

  def detect_winner
    return :player if player.total > dealer.total || dealer.busted?
    return :dealer if dealer.total > player.total || player.busted?
  end

  def show_result
    puts "You finished with #{player.cards} with a total of #{player.total}. The dealer finished on #{dealer.total}."
    winner = detect_winner
    if winner == :player
      puts "You won!"
    elsif winner == :dealer
      puts "You lost! The dealer wins!"
    else
      puts "It's a tie!"
    end
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start
