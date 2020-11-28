module ChangeStash
  attr_accessor :change_stash, :load_change_stash, :restock_change_stash, :display_change_stash
  def initialize_change_stash
    @change_stash = {
      "£2" => 0,
      "£1" => 0,
      "50p" => 0,
      "20p" => 0,
      "10p" => 0,
      "5p" => 0,
      "2p" => 0,
      "1p" => 0,
    }
  end

  def load_change_stash change_amount=nil
    # initial load
    unless change_amount
      @change_stash.each do |change_amount_key, change_amount_quantity|
        update_change_stash(change_amount_key)
      end
    else
      # change amount exists when it is a reload(restock)
      update_change_stash(change_amount)
    end
  end

  def restock_change_stash
    puts "Select a change amount you want to restock by entering its change amount"
    change_amount = gets.chomp
    load_change_stash(change_amount)
  end

  def update_change_stash change_amount
    puts "Enter the quantity of this denomination of change you want to load"
    quantity = gets.chomp.to_i
    @change_stash[change_amount] += quantity
  end

  def update_stash_after_change change_denomination
    @change_stash[change_denomination] -= 1 if change_denomination
  end

  def display_change_stash
    change_stash_displayed = []
    @change_stash.each do |change_stash_key, change_stash_quantity|
      quantity = change_stash_quantity == 0 ? "none" : change_stash_quantity
      change_stash_displayed << {change_stash_key => quantity}
    end
    puts "#{change_stash_displayed}"
  end

  def change_stash_amount_value change_amount
    if change_amount[-1] == "p"
      (change_amount.chop.to_f / 100)
    else
      (change_amount[1..-1].to_f)
    end
  end

  def expected_change amount_paid, product_amount
    amount_paid - product_amount
  end

  def no_change available_change, change_required, amount_paid
    if available_change == 0.0
      puts "There is no change available at this time, here's your refund, please vend again and enter an exact or lower amount, or wait for change to be reloaded."
      puts "Product => none, Refund => #{amount_paid}"
    elsif available_change < change_required
      # I feel more logic could get in here some.
      puts "There is isn't enough change available at this time, here's your refund, please vend again and enter exact amount, or wait for change to be reloaded."
      puts "Product => none, Refund => #{amount_paid}"
    end
  end

  def change_returned_to_customer required_change, amount_paid
    already_in_customer_change_arr = 0.0
    while required_change != 0.0
      change_denomination = find_change_in_stash(required_change)
      unless change_denomination
        return no_change(already_in_customer_change_arr, required_change, amount_paid)
      end
      # remove change from stash
      update_stash_after_change(change_denomination)
      customer_change << change_denomination
      already_in_customer_change_arr += change_stash_amount_value(change_denomination)
      required_change = (required_change -= change_stash_amount_value(change_denomination)).round(2)
    end
    customer_change
  end
end