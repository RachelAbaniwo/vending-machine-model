# Vending Machine Model
This is a fun model of a vending machine built in Ruby, RSpec, a testing framework is used for testing.

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

- To restart

```
rubymain.rb
```
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


