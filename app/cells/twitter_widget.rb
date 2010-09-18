class TwitterWidget < Apotomo::Widget
  responds_to_event :submit, :with => :process_tweet
  responds_to_event :taskFinished, :with => :redraw
  
  # after_appended
  #with_root do |me|
  #  me.root.respond_to_event :taskFinished, :on => me.name, :with => :redraw
 # end
  
  def display_form
    @tweets = Tweet.find(:all)
    render
  end
  
  def process_tweet
    Tweet.new(:text => param(:text)).save
    
    @tweets = Tweet.find(:all) # this is wet!
    replace :view => :display_form
    #replace :state => :display_form
  end
  
  def redraw
    replace :state => :display_form
  end
  
end
