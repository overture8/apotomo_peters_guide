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
    @tweet = Tweet.new 
    @tweet.update_attributes(param(:tweet))
    
    update :view => :display_form
  end
  
  def redraw
    update :view => :display_form
  end
  
end
