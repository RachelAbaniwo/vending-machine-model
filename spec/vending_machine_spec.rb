require 'vending_machine'

class TestVendingMachine
end
describe 'vending_machine' do
  before(:each) do
	  @test_vending_machine = VendingMachine.new
  end

  describe '#initialize' do
    it 'when initialized, each product item should have a name' do
      expect(@test_vending_machine.products["001"][:name]).to eq "Sprite"
    end

    it 'when initialized, each product item should have a price' do
      expect(@test_vending_machine.products["001"][:price]).to eq 1.30
    end

    it 'when initialized, each product item should have a quantity of zero' do
      expect(@test_vending_machine.products["001"][:quantity]).to eq 0
    end

    it 'when initialized, each change entry should have an amount and quantity as key value pairs' do
      expect(@test_vending_machine.change_stash["£2"]).to eq 0
    end

    it 'when initialized, each change entry should have a quantity of zero' do
      expect(@test_vending_machine.change_stash["2p"]).to eq 0
    end
      
  end
end