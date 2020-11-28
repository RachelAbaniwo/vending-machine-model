require 'change_stash'

class TestChangeStash
end
describe 'change_stash' do
  before(:each) do
	  @test_change_stash = TestChangeStash.new
	  @test_change_stash.extend(ChangeStash)
	  @test_change_stash.initialize_change_stash
  end
  
  describe '#initialize_change_stash' do
    it 'when initialized, each change entry should have an amount and quantity as key value pairs' do
      expect(@test_change_stash.change_stash["£2"]).to eq 0
    end

    it 'when initialized, each change entry should have a quantity of zero' do
      expect(@test_change_stash.change_stash["2p"]).to eq 0
    end
  end

  describe '#load_change_stash' do
    it 'when called and input is 10, each product item should have a quantity of 10 after initial loading' do
      
      expect(@test_change_stash.change_stash["£2"]).to eq 0

      allow_any_instance_of(Object).to receive(:gets).and_return "10"
      @test_change_stash.load_change_stash

      expect(@test_change_stash.change_stash["£2"]).to eq 10
      expect(@test_change_stash.change_stash["20p"]).to eq 10
      expect(@test_change_stash.change_stash["2p"]).to eq 10
    end
  end

  describe '#restock_change_stash' do
    it 'when called and inputs are £2 and 14, £2 should have a quantity update from 0 to 14 after restock' do

      expect(@test_change_stash.change_stash["£2"]).to eq 0

      allow_any_instance_of(Object).to receive(:gets).and_return("£2", "14")
      @test_change_stash.restock_change_stash

      expect(@test_change_stash.change_stash["£2"]).to eq 14
    end
  end
end