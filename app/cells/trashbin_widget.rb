class TrashbinWidget < Apotomo::Widget
  responds_to_event :drop, :with => :trash
  
  def display
    setup!
    
    render :layout => 'portlet'
  end
  
  def trash
    setup!
    
    Tweet.find(params[:id]).delete
    trigger :tweetDeleted
    
    update :view => :display
  end
  
private
  def setup!
    @title = @opts[:title]
  end
end
