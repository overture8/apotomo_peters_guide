class TweetWidget < Apotomo::Widget
  def display
    @tweet = @opts[:tweet]
    render
  end
  
end
