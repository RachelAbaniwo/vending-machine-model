module ProductInventory
  attr_accessor :products, :load_product_inventory, :restock_product_inventory, :display_product_inventory, :find_product_and_throw_error, :update_product_inventory
  
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
      puts " "
      puts "This is what currently exists in the product inventory"
      puts " "
      display_product_inventory
      puts "Update items accordingly."
      puts " "
      # during an initial load
      @products.each do |product_key, product_information|
        update_product_quantity(product_information)
      end
      puts "This is what you have in the updated product inventory"
      puts " "
      display_product_inventory
    else
      # product_id exists when this load is a reload
      puts "Update items accordingly."
      puts " "
      update_product_quantity(@products[product_id])
      puts "This what you have in the updated product inventory"
      puts " "
      display_product_inventory
    end
  end

  def restock_product_inventory
    # reload vending machine
    display_product_inventory
    puts "Select a product you want to restock using its number"
    product_id = gets.chomp
    if @products[product_id]
      load_product_inventory(product_id)
    else
      find_product_and_throw_error(product_id)
    end
  end

  def display_product_inventory
    displayed_products = []
    @products.each do |product_key, product_information|
      quantity = product_information[:quantity] == 0 ? "Out of Stock" : product_information[:quantity]
      displayed_products << {"Product ID" => product_key}.merge({"Product Name" => product_information[:name], "Product Price" => product_information[:price], "Quantity" => quantity })
    end
    puts displayed_products
  end

  def update_product_quantity product
    puts "You have #{product[:quantity]} units of #{product[:name]} left, enter the quantity of this product you want to load"
    quantity = gets.chomp.to_i
    product[:quantity] += quantity
  end

  def find_product_and_throw_error product_id
    product = @products[product_id]
    if product
      if product[:quantity] > 0 
        product
      else
        puts "This item is out of stock, please vend again and select a product in stock."
      end
    else
      puts "This isn't a valid product id, please vend again and select a valid product in stock"
    end
  end

  def update_product_inventory product_id
    @products[product_id][:quantity] -= 1
  end

end