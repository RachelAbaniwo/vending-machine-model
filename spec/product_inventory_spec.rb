require 'product_inventory'

class TestProductInventory
end
describe 'product_inventory' do
  before(:each) do
	  @test_product_inventory = TestProductInventory.new
	  @test_product_inventory.extend(ProductInventory)
	  @test_product_inventory.initialize_product_inventory
  end
  
  describe '#initialize_product_inventory' do
    it 'when the product inventory is initialized, each product item should have a name' do
      expect(@test_product_inventory.products["001"][:name]).to eq "Sprite"
    end

    it 'when the product inventory is initialized, each product item should have a price' do
      expect(@test_product_inventory.products["001"][:price]).to eq 1.30
    end

    it 'when the product inventory is initialized, each product item should have a quantity of zero' do
      expect(@test_product_inventory.products["001"][:quantity]).to eq 0
    end
      
  end
end