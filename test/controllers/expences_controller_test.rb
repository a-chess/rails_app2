require 'test_helper'

class ExpencesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get expences_edit_url
    assert_response :success
  end

end
