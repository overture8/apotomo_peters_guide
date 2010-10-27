require "test_helper"

class TwitterWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:twitter_widget, 'me', :display_form)
  end
  
  test "should render" do
    render_widget 'me'
    assert_select "ul"
  end
end
