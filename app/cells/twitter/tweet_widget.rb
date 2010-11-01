module Twitter
  class TweetWidget < Apotomo::Widget
    responds_to_event :heart, :with => :toggle
    
    def display
      @tweet = param(:tweet)
      render
    end
    
    def toggle
      @tweet = Tweet.find(param(:id))
      @tweet.toggle_loved
      
      replace :view => :display
    end
    
  end
end
