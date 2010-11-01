require "test_helper"

class TweetWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget("twitter/tweet_widget", 'me', :tweet => Tweet.find(:first))
  end
  
  def test_render
    render_widget 'me'
    assert_select "li#me" # TODO: test data-event-url, too.
  end
end
