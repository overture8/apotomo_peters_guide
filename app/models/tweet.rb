class Tweet < ActiveRecord::Base
  def toggle_loved
    self.loved = !self.loved
    save
  end
end
