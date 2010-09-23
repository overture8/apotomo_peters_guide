class TwitterWidget < Apotomo::Widget
  responds_to_event :submit, :with => :process_tweet
  
  after_add do |me, parent|
    me.root.respond_to_event :tweetDeleted, :with => :redraw, :on => me.name
  end
  
  def display_form
    @tweets = Tweet.find(:all)
    render
  end
  
  def process_tweet
    Tweet.new(:text => param(:text)).save
    
    @tweets = Tweet.find(:all) # this is wet!
    replace :view => :display_form
  end
  
  def redraw
    replace :state => :display_form
  end
  
end
