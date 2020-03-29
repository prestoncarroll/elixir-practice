defmodule Cards do
    @moduledoc """
provides methods for creating and handling a deck of cards.
    """

#  sets your value and suits array aka creates the deck


@doc """ 
returns a list of strings representing a deck of playing cards 
"""

    def create_deck do
        values = ["Ace", "Two", "Three", "Four", "Five"]
        suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

# merges the suits and values together!
        for suit <- suits, value <- values do

        "#{value} of #{suit}"
        

        end

    end


#  shuffles the deck using enum! (elixer documentation)
    def shuffle(deck) do
        Enum.shuffle(deck)
        # Cards.shuffle(deck)
    end


# checks to see if you have a specific card or suit 
    def contains?(deck, card) do

        Enum.member?(deck, card)
        # recompile
        # cli = deck = Cards.create_deck
        # cli = Cards.contains?(deck, "Two")
        # output =  true

    end

    #  deals your cards and you can vary your hand_size with an integer Cards.deal(deck, 4)
    def deal(deck, hand_size) do

       Enum.split(deck,hand_size)
    end



    def save(deck, filename) do
        
        binary = :erlang.term_to_binary(deck)
        File.write(filename, binary)

    end



    # Cards.load("my_Deck")
    # throws an error if file not found
    def load(filename) do


        # CLI= :erlang.binary_to_term(binary)
        case File.read(filename) do
        {:ok, binary} -> :erlang.binary_to_term binary
        {:error, _reason} -> "that file does not exist"
        end
    end

# using the pipe operater to add of your function to one place
    def create_hand(hand_size) do
         Cards.create_deck
        |> Cards.shuffle
        |> Cards.deal(hand_size)

    end




end
