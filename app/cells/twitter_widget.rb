class TwitterWidget < Apotomo::Widget
  responds_to_event :submit, :with => :process_tweet
  
  after_add do |me, parent|
    me.root.respond_to_event :tweetDeleted, :with => :redraw, :on => me.name
  end
  
  has_widgets do |me|
    synchronize_with_model!
  end
  
  def synchronize_with_model!
    for t in Tweet.find(:all)
      child_id = "tweet-#{t.id}"
      next if self[child_id]  # we already added it.
      
      self << widget(:tweet_widget, child_id, :display, :tweet => t)
    end
  end
  
  def display_form
    render :layout => 'portlet'
  end
  
  def process_tweet
    @tweet = Tweet.new
    @tweet.update_attributes(param(:tweet))
    
    synchronize_with_model!
    
    update :view => :display_form
  end
  
  def redraw
    update :view => :display_form
  end
  
end
