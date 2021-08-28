require 'card'

describe Card do

  it 'checks that a card has a value and a suit' do
    card = Card.new(5, :spades)
    expect(card.value).to eq 5
    expect(card.suit).to eq :spades
  end

  it 'checks the real value of a card' do 
    card = Card.new(:ace, :hearts)
    expect(card.real_value).to eq 1
  end

  it ' converts the real value and suit of a card to a string' do
    card = Card.new(:jack, :diamonds)
    card_string = card.to_s
    expect(card_string).to eq "the jack of diamonds"
  end

end


