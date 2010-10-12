class Tweet < ActiveRecord::Base
  validates_presence_of :text
  
  def toggle_loved
    self.loved = !self.loved
    save
  end
end
