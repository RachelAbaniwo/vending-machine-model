# Vending Machine Model
This is a fun model of a vending machine built in Ruby, RSpec, a testing framework is used for testing. This took about 2-3hours, to code and some more time making decisions.

## Background and Specification

Design a vending machine that does the following;
- Returns the right product once an item is selected and appropriate amount is inserted.
- Return change if need be.
- Request for more money if insufficient funds are inserted.
- Ability to load it with products and change, with change in denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2.
- Reload products or change at a later point
- Keep track of the products and change available.

## Running the Machine

Technologies used were Ruby and RSpec for testing.

### To set up

- clone repository
```
https://github.com/RachelAbaniwo/vending-machine-model.git
```

- to start, go to app directory and run
```
ruby main.rb
```

- instructions are pretty straight forward from then on.

#### More commands

- To restart and try more commands run

```
irb
```
```
require './lib/vending_machine'
```
```
vending_machine = VendingMachine.new
```
- To do an initial load and then use vending machine run,
```
vending_machine.load_and_vend
```
- All following commands can be tried out in the command line, upon resolveing the above.

- To Restock products at a later time, run
```
vending_machine.restock
```
and follow the prompt

- To Vend again after a successful or unsuccessful try(to avoid a full initial reload), run
```
vending_machine.vend_again
```

- To view all products available, run
```
vending_machine.display_products
```

- To view all change available, run
```
vending_machine.display_available_change
```

#### Testing

To test run

```
rspec                                ## runs the entire test suite
rspec spec/file.rb                   ## runs a specific test file
```

## Approach and Considerations

A Lot of thought went into the best way to implement this is the shortest time possible. One part that stood out for me, was making decisions on the architechture and making sure the Classes created were indeed necessary.

I decided to start working from the vending machine class, even though I was certain I didn't want unecessary logic in it, working from that file, I was able to move most of the methods to classes I felt they belonged, and would be the most useful.

The `VendingMachine` gives direct access to the machine, while the `ProductInventory` and `ChangeStash` are concerned with products and change respectively.

I also wanted an interface like experience while using the machine, even though the command line is used in experiencing how it works, I wanted it to be as user friendly and interactive as possible.

## Challenges

Making the most out of this challenge for the user was a challenge, I tried as much as possible to display information as was necessary, this became an issue while testing. More specifically, testing for the messages displayed to the user after successful or not so successful interactions with the machine.

Returning the correct amount of change to the user was also something, as I worked on that part of the challenge, I found there was a lot to take into consideration.


## Improvements
This took about 2-3 hours, but here are things I'd have thought to include if I spent more time;

- This definitely needs more testing. 
- It could also accept more dynamic inputs.
- There's a need to allow users load products that do not exist on the initial list.
- And also get the opportunity to update the amount they pay for products, if this is insufficient.
- There should be a more interesting way to handle a situation where there is no/insufficient change available, this could be an option if a refund isn't what the user wants.
- And a lot more testing.
- Error handling could also be better and properly thought through given more time.



