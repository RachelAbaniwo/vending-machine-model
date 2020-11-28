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
end