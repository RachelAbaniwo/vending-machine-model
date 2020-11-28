module ChangeStash
  attr_accessor :change_stash
  def initialize_change_stash
    @change_stash = {
      "£2" => 0,
      "£1" => 0,
      "50p" => 0,
      "20p" => 0,
      "10p" => 0,
      "5p" => 0,
      "2p" => 0,
      "1p" => 0,
    }
  end
end