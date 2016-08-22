require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  
  test "full title helper" do
    assert_equal full_title, ("Ruby on Rails樣品應用程式")
    assert_equal full_title("協助"), ("協助 | Ruby on Rails樣品應用程式")
  end
end