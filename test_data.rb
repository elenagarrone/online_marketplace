require './lib/checkout'
require './lib/item'
require './lib/percent_off'
require './lib/two_or_more_offer'
require './lib/promotional'

lavender_heart          = Item.new('001', 'Lavender heart', 9.25)
kids_tshirt             = Item.new('003', 'Kids T-shirt', 19.95)
personalised_cufflinks  = Item.new('002', 'Personalised cufflinks ', 45.0)
two_or_more             = Two_or_more_offer.new(lavender_heart, 8.50)
ten_percent_off         = Percent_off.new(10, 60.0)
promotional             = Promotional.new
co                      = Checkout.new(promotional)

promotional.add(two_or_more)
promotional.add(ten_percent_off)


puts "Test data"
puts "---------"
puts "Basket: 001,002,003"
co.scan(lavender_heart)
co.scan(personalised_cufflinks)
co.scan(kids_tshirt)
puts "Total price expected: £#{co.total}"
co.clear_basket

puts "Basket: 001,003,001"
co.scan(lavender_heart)
co.scan(kids_tshirt)
co.scan(lavender_heart)
puts "Total price expected: £#{co.total}"
co.clear_basket

puts "Basket: 001,002,001,003"
co.scan(lavender_heart)
co.scan(personalised_cufflinks)
co.scan(lavender_heart)
co.scan(kids_tshirt)
puts "Total price expected: £#{co.total}"
co.clear_basket
