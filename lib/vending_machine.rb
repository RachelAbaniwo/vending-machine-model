require_relative 'product_inventory'
require_relative 'change_stash'

class VendingMachine
  include ProductInventory
  include ChangeStash

  def initialize
    initialize_product_inventory
    initialize_change_stash
  end

  def run
    # preload product inventory
    @products.each do |product_key, product_information|
      puts "Enter the quantity of this product you want to load"
      quantity = gets.chomp.to_i
      product[:quantity] += quantity
    end

    # preload change stash
    @change_stash.each do |change_amount_key, change_amount_quantity|
      puts "Enter the quantity of this denomination of change you want to load"
      quantity = gets.chomp.to_i
      @change_stash[change_amount] += quantity
    end
  end
end