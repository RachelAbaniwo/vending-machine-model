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

end