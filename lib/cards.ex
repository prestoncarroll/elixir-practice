defmodule Cards do
    @moduledoc """
       provides methods for creating and handling a deck of cards.
    """




@doc """ 
returns a list of strings representing a deck of playing cards 

## Example

        iex> deck = Cards.create_deck
       
"""

    def create_deck do
        values = ["Ace", "Two", "Three", "Four", "Five"]
        suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

# merges the suits and values together!
        for suit <- suits, value <- values do

        "#{value} of #{suit}"
        

        end

    end




@doc """ 
shuffles deck of cards

## Example

        iex> deck = Cards.create_deck
        iex> Cards.shuffle(deck)
"""
    def shuffle(deck) do
        Enum.shuffle(deck)
        # Cards.shuffle(deck)
    end


# checks to see if you have a specific card or suit 


@doc """ 
checks to see if a specific `card` is in the deck.

## Example

    
        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true
"""
    def contains?(deck, card) do

        Enum.member?(deck, card)
       

    end

    

    @doc """
    divides a deck into a hand and the remainder of the deck.
    the `hand_size` agrugment indicates how many cards should be in the hand.

    ## Example

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

    """
    def deal(deck, hand_size) do

       Enum.split(deck,hand_size)
    end





    @doc """
    saves deck to your `filename`.

    ## Example

        #  iex> Cards.save(deck, 'my_deck')

    """
    def save(deck, filename) do
        
        binary = :erlang.term_to_binary(deck)
        File.write(filename, binary)

    end


 @doc """
    loads deck from your `filename`.

    ## Example

        iex> Cards.load("my_deck")

    """
   
    
    def load(filename) do


        # CLI= :erlang.binary_to_term(binary)
        case File.read(filename) do
        {:ok, binary} -> :erlang.binary_to_term binary
        {:error, _reason} -> "that file does not exist"
        end
    end

# using the pipe operater to add of your function to one place

@doc """
    Creates a hand based on your `hand_size`.

    ## Example
        iex(1)> deck = Cards.create_deck
        iex> Cards.create_hand(4)
        

    """
    def create_hand(hand_size) do
         Cards.create_deck
        |> Cards.shuffle
        |> Cards.deal(hand_size)

    end




end
