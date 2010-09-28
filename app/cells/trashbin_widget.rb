class TrashbinWidget < Apotomo::Widget
  responds_to_event :drop, :with => :trash
  
  def display
    render :layout => 'portlet'
  end
  
  def trash
    Tweet.find(params[:id]).delete
    trigger :tweetDeleted
    
    replace :view => :display
  end
end
