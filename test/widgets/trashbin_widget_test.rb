require 'test_helper'

class TrashbinWidgetTest < Apotomo::TestCase
    
  has_widgets do |root|
    root << widget(:trashbin_widget, 'me')
  end
  
  test "display" do
    render_widget 'me'
    assert_select 'img[src*="trashbin_empty.png"]'
  end
  
  test "dumping an item" do
    assert_equal [tweets(:rule), tweets(:ass)], Tweet.find(:all)
    
    render_widget 'me'

    trigger :drop, :source => 'me', :id => tweets(:ass).id
    assert_response /\$\("#me"\).html/
    
    assert_equal [tweets(:rule)], Tweet.find(:all)
  end
end
