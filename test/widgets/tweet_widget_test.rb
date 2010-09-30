require "test_helper"

class TweetWidgetTest < Test::Unit::TestCase
  test "a first test" do
    html = widget(:tweet_widget, :display, 'my_tweet_widget').invoke
    assert_selekt html, "p"
  end
end
