class TwitterWidget < Apotomo::Widget
  responds_to_event :submit, :with => :process_tweet

  def display
    @tweets = Tweet.find(:all)
    render
  end
  
  def process_tweet(evt)
    Tweet.new(:text => evt[:text]).save

    @tweets = Tweet.find(:all) # this is wet!
    replace :view => :display
  end
end
