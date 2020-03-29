defmodule Cards do
 
 def create_deck do
["Ace", "Two", "Three"]
 end

 def shuffle(deck) do
Enum.shuffle(deck)
end

 def contains?(deck, card) do

    Enum.member?(deck, card)
    # recompile
    # cli = deck = Cards.create_deck
    # cli = Cards.contains?(deck, "Two")
    # output =  true

 end


end
