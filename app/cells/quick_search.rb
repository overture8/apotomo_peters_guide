class QuickSearch < Apotomo::Widget
  responds_to_event :typing, :with => :search
  
  def display
    render :layout => 'portlet'
  end
  
  def search
    items = Tweet.find(:all, :conditions => "text LIKE '%#{param(:term)}%'").
    collect do |t|
      {:label => t.text}
    end
    
    render :text => items.to_json
  end
end
