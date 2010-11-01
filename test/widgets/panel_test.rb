require "test_helper"

class PanelTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget("twitter/panel", 'me', :display_form)
  end
  
  test "should render" do
    render_widget 'me'
    assert_select "ul"
  end
end
