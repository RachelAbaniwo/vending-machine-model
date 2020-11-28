module ProductInventory
  attr_accessor :products
  def initialize_product_inventory
    @products = {
      "001" => { name: "Sprite", price: 1.30, quantity: 0},
      "002" => { name: "Mountain Dew", price: 1.30 , quantity: 0},
      "003" => { name: "7UP", price: 1.30, quantity: 0},
      "004" => { name: "Coke", price: 1.30, quantity: 0},
      "005" => { name: "Mars", price: 0.60, quantity: 0},
      "006" => { name: "Cookies", price: 0.80, quantity: 0},
      "007" => { name: "Crackers", price: 0.70, quantity: 0}
    }
  end

  def load_product_inventory product_id=nil
    unless product_id
      # during an initial load
      @products.each do |product_key, product_information|
        update_product_quantity(product_information)
      end
    else
      # product_id exists when this load is a reload
      update_product_quantity(@products[product_id])
    end
  end

  def restock_product_inventory
    # reload vending machine
    puts "Select a product you want to restock using its number"
    product_id = gets.chomp
    load_product_inventory(product_id)
    end
  end

  def update_product_quantity product
    puts "enter the quantity of this product you want to load"
    quantity = gets.chomp.to_i
    product[:quantity] += quantity
  end
end