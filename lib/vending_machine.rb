require_relative 'product_inventory'
require_relative 'change_stash'

class VendingMachine
  include ProductInventory
  include ChangeStash

  def initialize
    initialize_product_inventory
    initializa_change_stash
  end
end