defmodule Cards do
 
 def create_deck do
values = ["Ace", "Two", "Three", "Four", "Five"]
suits = ["Spades", "Clubs", "Hearts", "Diamonds"]


for suit <- suits, value <- values do

"#{value} of #{suit}"
   

end

 end

 def shuffle(deck) do
Enum.shuffle(deck)
# Cards.shuffle(deck)
end

 def contains?(deck, card) do

    Enum.member?(deck, card)
    # recompile
    # cli = deck = Cards.create_deck
    # cli = Cards.contains?(deck, "Two")
    # output =  true

 end


end
