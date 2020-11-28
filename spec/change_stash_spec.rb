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
end