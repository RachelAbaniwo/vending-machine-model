require_relative 'product_inventory'
require_relative 'change_stash'

class VendingMachine
  include ProductInventory
  include ChangeStash

    def initialize
      initialize_product_inventory
      initialize_change_stash
    end

    def load_and_vend
      load_product_inventory
      load_change_stash
      vend
    end

    def restock
      restock_product_inventory
      restock_change_stash
    end

    def vend_again
      vend
    end

    def display_products
      display_product_inventory
    end

    def display_available_change
      display_change_stash
    end

    private

    def vend
      puts "These are our available products and their prices, the Product ID will help us identify products you select."
      puts "     "
      display_product_inventory
      puts "     "
      puts "Enter the product id of the product you want to purchase"
      product_id = gets.chomp
      product = find_product_and_throw_error(product_id)
      if product
        puts "Insert cash by entering the amount of money you're paying, (It should be in £, money paid in pence should be entered as a fraction of £1, type only numbers, decimals are allowed.)"
        amount_paid = gets.chomp.to_f
        customer_change = validate_amount_paid_and_return_change(amount_paid, product_id)
        if customer_change
          update_product_inventory(product_id)
          puts "Here's your purchased item and change."
          puts "Product => #{products[product_id][:name]}, Change => #{customer_change}"
          {"Product" => products[product_id][:name], "Change" => customer_change}
        end
      end
    end

    def validate_amount_paid_and_return_change amount_paid, product_id
      product_amount = products[product_id][:price]
      if amount_paid == 0
        puts "You have entered an invalid amount of money, try picking another product or entering a valid amount by vending again."
        return
      elsif amount_paid < product_amount
        puts "You have entered an insufficient amount of money for the product you selected, here's a refund, try picking another product or entering a valid amount by vending again."
        puts "Product => none, Refund => #{amount_paid}"
        return
      else
        change = expected_change(amount_paid, product_amount)
        change_returned_to_customer(change, amount_paid)
      end
    end
    
end