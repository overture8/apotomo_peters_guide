class AddLovedFlagToTweet < ActiveRecord::Migration
  def self.up
    add_column :tweets, :loved, :boolean
  end

  def self.down
    remove_column :tweets, :loved
  end
end
