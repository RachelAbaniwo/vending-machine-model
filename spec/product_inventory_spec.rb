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

  describe '#load_product_inventory' do
    it 'when called and 3 is the input, each product item should have a quantity of 3' do
      
      expect(@test_product_inventory.products["001"][:quantity]).to eq 0

      allow_any_instance_of(Object).to receive(:gets).and_return "3"
      @test_product_inventory.load_product_inventory

      expect(@test_product_inventory.products["001"][:quantity]).to eq 3
      expect(@test_product_inventory.products["004"][:quantity]).to eq 3
    end
  end

  describe '#restock_product_inventory' do
    it 'when called, with inputs 005 and 4, product item 005 should have a quantity update from 0 to 4 after restock' do

      expect(@test_product_inventory.products["004"][:quantity]).to eq 0

      allow_any_instance_of(Object).to receive(:gets).and_return("005", "4")
      @test_product_inventory.restock_product_inventory

      expect(@test_product_inventory.products["005"][:quantity]).to eq 4
    end
  end
end