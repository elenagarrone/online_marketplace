[![Code Climate](https://codeclimate.com/github/elenagarrone/online_marketplace/badges/gpa.svg)](https://codeclimate.com/github/elenagarrone/online_marketplace)

Online marketplace
==================
This is an online checkout system created using Ruby and Rspec for testing.

Technologies:
------------
- Ruby
- RSpec

How to use
----------
Clone the directory:
```shell
$ git clone https://github.com/elenagarrone/online_marketplace.git
```
Change into it:
```shell
$ cd online_marketplace
```
Play with it by running irb and requiring the runner file:
```shell
$ irb
> require './runner.rb'
```
or run the 'test_data' file so that you can see the results:
```shell
$ ruby test_data.rb
```

How to test it:
--------------
From inside the directory run:
```shell
$ rspec
```

How to customize an existing pormotion:
-----------------------------
- ####If you spend over £x, then you get y% off your purchase
#####`Percent_off.new(percentage, amount)`
All you need to do is to set the percentage you want to take off from the purchase and the minimum amount required to apply it.
Example: `forty_percent_off = Percent_off.new(40, 100.0)`


- ####If you buy x or more items then the price drops to £y
#####`X_or_more.new(min_number_of_items, item, new_price)`
Set the minimum number of items to buy to get the discount, specify to which item you want to apply it and set the new price. Example: `four_or_more_tshirts = X_or_more.new(4, kids_tshirt, 15.99)`
