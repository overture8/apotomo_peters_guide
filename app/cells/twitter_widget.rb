class TwitterWidget < Apotomo::Widget
  responds_to_event :submit, :with => :process_tweet
  
  after_add do |me, parent|
    me.root.respond_to_event :tweetDeleted, :with => :redraw, :on => me.name
  end
  
  has_widgets do |me|
    for t in Tweet.find(:all)
      me << widget(:tweet_widget, "tweet-#{t.id}", :display, :tweet => t)
    end
  end
  
  def display_form
    render :layout => 'portlet'
  end
  
  def process_tweet
    Tweet.new(:text => param(:text)).save
    
    @tweets = Tweet.find(:all) # this is wet!
    update :view => :display_form
  end
  
  def redraw
    update :state => :display_form
  end
  
end