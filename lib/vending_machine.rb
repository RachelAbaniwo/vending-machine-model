require_relative 'product_inventory'
require_relative 'change_stash'

class VendingMachine
  include ProductInventory
  include ChangeStash

  def initialize
    initialize_product_inventory
    initialize_change_stash
  end

  def load
    load_product_inventory
  end

  def restock
    restock_product_inventory
  end

end