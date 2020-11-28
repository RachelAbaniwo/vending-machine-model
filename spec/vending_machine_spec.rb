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

  describe '#vend_again' do

    it 'should return product and change if product and amount are valid and change is available' do

      expect(@test_vending_machine.products["003"][:quantity]).to eq 0
      allow_any_instance_of(Object).to receive(:gets).and_return "5"
      @test_vending_machine.load_product_inventory
      expect(@test_vending_machine.products["003"][:quantity]).to eq 5

      expect(@test_vending_machine.change_stash["£2"]).to eq 0
      allow_any_instance_of(Object).to receive(:gets).and_return "10"
      @test_vending_machine.load_change_stash
      expect(@test_vending_machine.change_stash["£2"]).to eq 10
      allow_any_instance_of(Object).to receive(:gets).and_return("003", "1.5")
      output = @test_vending_machine.vend_again

      expect(output["Product"]).to eq "7UP"
      expect(output["Change"]).to eq ["10p", "10p"]
      expect(@test_vending_machine.products["003"][:quantity]).to eq 4
    end

    it 'should not return product if valid product and no change is available' do

      expect(@test_vending_machine.products["001"][:quantity]).to eq 0
      allow_any_instance_of(Object).to receive(:gets).and_return "5"
      @test_vending_machine.load_product_inventory
      expect(@test_vending_machine.products["001"][:quantity]).to eq 5
      allow_any_instance_of(Object).to receive(:gets).and_return("003", "2")
      output = @test_vending_machine.vend_again

      expect(@test_vending_machine.products["001"][:quantity]).to eq 5
    end
  end

  it 'should not return product if valid product and an insufficient amount is inputed' do

    expect(@test_vending_machine.products["002"][:quantity]).to eq 0
    allow_any_instance_of(Object).to receive(:gets).and_return "5"
    @test_vending_machine.load_product_inventory
    expect(@test_vending_machine.products["002"][:quantity]).to eq 5
    allow_any_instance_of(Object).to receive(:gets).and_return("003", "0.5")
    output = @test_vending_machine.vend_again

    expect(@test_vending_machine.products["002"][:quantity]).to eq 5
  end

end