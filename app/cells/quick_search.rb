class QuickSearch < Apotomo::Widget
  responds_to_event :typing, :with => :search
  
  def display
    render :layout => 'portlet'
  end
  
  def search
    tweets = Tweet.find(:all, :conditions => "text LIKE '%#{param(:term)}%'")  
    tweets.collect do |t|
      {:label => t.text}
    end.to_json
  end
end
